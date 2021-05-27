import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:comidinhas/app/app.logger.dart';
import 'package:comidinhas/models/receita.dart';

class ReceitaService {
  final log = getLogger('ReceitaService');

  final CollectionReference<Map<String, dynamic>> receitaCollection =
      FirebaseFirestore.instance.collection('receitas');

  final StreamController<List<Receita>> _receitasController =
      StreamController<List<Receita>>.broadcast();

  Stream listenReceitas() {
    log.i('Getting receitas data');
    receitaCollection.snapshots().listen((receitasSnapshot) {
      final receitasDocs = receitasSnapshot.docs;
      log.v('Receitas ${receitasDocs.length}');
      if (receitasDocs.isNotEmpty) {
        var receitas = receitasDocs
            .map((snapshot) => Receita.fromMap(snapshot.data(), snapshot.id))
            .toList();

        _receitasController.add(receitas);
      }
    });

    return _receitasController.stream;
  }
}
