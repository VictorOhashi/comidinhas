import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:comidinhas/app/app.logger.dart';
import 'package:comidinhas/models/receita.dart';

class ReceitaService {
  final log = getLogger('ReceitaService');

  final CollectionReference<Map<String, dynamic>> receitaCollection =
      FirebaseFirestore.instance.collection('receitas');

  Future<List<Receita>> getReceitas() async {
    log.i('Getting receitas data');

    final receitasDocs = (await receitaCollection.get()).docs;

    log.v('Receitas ${receitasDocs.length}');

    return receitasDocs
        .map((snapshot) => Receita.fromMap(snapshot.data(), snapshot.id))
        .toList();
  }
}
