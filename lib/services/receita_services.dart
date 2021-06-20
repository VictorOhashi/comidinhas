import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/app/app.logger.dart';
import 'package:comidinhas/models/application_models.dart';
import 'package:comidinhas/models/categoria.dart';
import 'package:comidinhas/models/receita.dart';
import 'package:comidinhas/services/user_services.dart';

const int ReceitasLimit = 20;

class ReceitaService {
  final log = getLogger('ReceitaService');

  final UserService _userService = locator<UserService>();

  final CollectionReference<Map<String, dynamic>> _receitaCollection =
      FirebaseFirestore.instance.collection('receitas');

  final CollectionReference<Map<String, dynamic>> _categoriaCollection =
      FirebaseFirestore.instance.collection('categorias');

  var _receitasController = StreamController<List<ReceitaWithUser>>.broadcast();

  var _allPagedResults = List<List<ReceitaWithUser>>.empty(growable: true);

  DocumentSnapshot? _lastDocument;
  bool _hasMorePosts = true;

  List<User> _users = [];
  List<User> get users => _users;

  Future<List<ReceitaWithUser>> _getReceitasWithUser(
      List<Receita> receitas) async {
    var userToFetch = receitas.map((o) => o.userId).toSet();

    for (var userId in userToFetch) {
      final user = await _userService.getUser(userId: userId);
      if (user != null) {
        _users.add(user);
      }
    }

    return receitas.map((r) {
      return ReceitaWithUser(
        user: _users.firstWhere((user) => user.id == r.userId),
        documentId: r.documentId!,
        nome: r.nome,
        quantidadePessoas: r.quantidadePessoas,
        tempoPreparo: r.tempoPreparo,
        imagem: r.imagem,
        ingredientes: r.ingredientes,
        modoPreparo: r.modoPreparo,
        categorias: r.categorias,
        avaliacao: r.avaliacao,
      );
    }).toList();
  }

  void _requestReceitas() async {
    log.i('Getting receitas data');

    var receitasQuery = _receitaCollection.limit(ReceitasLimit);

    if (_lastDocument != null) {
      receitasQuery = receitasQuery.startAfterDocument(_lastDocument!);
    }

    if (!_hasMorePosts) return;

    var currentRequestIndex = _allPagedResults.length;

    receitasQuery.snapshots().listen((receitasSnapshot) async {
      var receitaDocs = receitasSnapshot.docs;
      if (receitaDocs.isNotEmpty) {
        log.v('Fetched ${receitaDocs.length} receitas');

        var receitasData = await _getReceitasWithUser(receitaDocs
            .map((docs) => Receita.fromMap(docs.data(), docs.id))
            .toList());

        var pageExists = currentRequestIndex < _allPagedResults.length;

        if (pageExists) {
          _allPagedResults[currentRequestIndex] = receitasData;
        } else {
          _allPagedResults.add(receitasData);
        }

        var allReceitas = _allPagedResults.fold<List<ReceitaWithUser>>(
          List<ReceitaWithUser>.empty(growable: true),
          (initialValue, pageItems) => initialValue..addAll(pageItems),
        );

        _receitasController.add(allReceitas);

        if (currentRequestIndex == _allPagedResults.length - 1) {
          _lastDocument = receitaDocs.last;
        }

        _hasMorePosts = receitasData.length == ReceitasLimit;
      }
    });
  }

  Stream listenToReceitas() {
    _requestReceitas();
    return _receitasController.stream;
  }

  void requestMoreData() => _requestReceitas();

  Future<List<ReceitaWithUser>> getReceitasWithId({List<String>? ids}) async {
    log.i('Getting receitas data');

    final receitasCollection = await _receitaCollection
        .where(FieldPath.documentId, whereIn: ids)
        .get();

    final receitasDocs = receitasCollection.docs;
    log.v('Fetched ${receitasDocs.length} receitas');

    var receitasData = receitasDocs
        .map((docs) => Receita.fromMap(docs.data(), docs.id))
        .toList();

    return _getReceitasWithUser(receitasData);
  }

  Future<List<Categoria>> getCategorias() async {
    log.i('Getting categorias data');

    final categoriasCollection = await _categoriaCollection.get();
    final categoriasDocs = categoriasCollection.docs;

    log.v('Fetched ${categoriasDocs.length} categorias');

    return categoriasDocs
        .map((docs) => Categoria.fromMap(docs.data(), docs.id))
        .toList();
  }

  Future<ReceitaWithUser> addReceita(Receita receita) async {
    log.i('Addeing new receita');

    var addedReceita = await _receitaCollection.add(receita.toMap());
    var receitas = await getReceitasWithId(ids: [addedReceita.id]);

    return receitas[0];
  }

  Future<ReceitaWithUser> updateReceita(Receita receita) async {
    log.i('Updating receita ${receita.documentId}');

    await _receitaCollection.doc(receita.documentId).update(receita.toMap());
    var receitas = await getReceitasWithId(ids: [receita.documentId!]);

    return receitas[0];
  }

  Future<List<ReceitaWithUser>> searchReceitas(String search) async {
    var nome = search.toLowerCase();

    log.i('Search receitas with $nome');
    final receitasCollection = await _receitaCollection
        .where("nome", isGreaterThanOrEqualTo: nome)
        .get();

    final receitasDocs = receitasCollection.docs;

    log.v('Fetched ${receitasDocs.length} receitas');

    var receitasData = receitasDocs
        .map((docs) => Receita.fromMap(docs.data(), docs.id))
        .toList();

    return _getReceitasWithUser(receitasData);
  }
}
