import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:comidinhas/app/app.locator.dart';
import 'package:comidinhas/app/app.logger.dart';
import 'package:comidinhas/models/application_models.dart';
import 'package:comidinhas/models/categoria.dart';
import 'package:comidinhas/models/receita.dart';
import 'package:comidinhas/services/user_services.dart';

class ReceitaService {
  final log = getLogger('ReceitaService');

  final UserService _userService = locator<UserService>();

  final CollectionReference<Map<String, dynamic>> _receitaCollection =
      FirebaseFirestore.instance.collection('receitas');

  final CollectionReference<Map<String, dynamic>> _categoriaCollection =
      FirebaseFirestore.instance.collection('categorias');

  final StreamController<List<ReceitaWithUser>> _receitaController =
      StreamController<List<ReceitaWithUser>>.broadcast();

  List<User> _users = [];
  List<User> get users => _users;

  Future<List<ReceitaWithUser>> getReceitasWithUser(
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
        documentId: r.documentId,
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

  Future<List<ReceitaWithUser>> getReceitas() async {
    log.i('Getting receitas data');

    final receitasCollection = await _receitaCollection.get();

    final receitasDocs = receitasCollection.docs;
    log.v('Fetched ${receitasDocs.length} receitas');

    var receitasData = receitasDocs
        .map((docs) => Receita.fromMap(docs.data(), docs.id))
        .toList();

    return getReceitasWithUser(receitasData);
  }

  Stream listenReceitasWithId({List<String>? ids}) {
    log.i('Listen to receitas with ids: $ids');

    _receitaCollection
        .where(FieldPath.documentId, whereIn: ids)
        .snapshots()
        .listen((receitasSnapshot) async {
      if (receitasSnapshot.docs.isNotEmpty) {
        var receitasData = receitasSnapshot.docs
            .map((docs) => Receita.fromMap(docs.data(), docs.id))
            .toList();

        var receitas = await getReceitasWithUser(receitasData);

        _receitaController.add(receitas);
      }
    });

    return _receitaController.stream;
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
}
