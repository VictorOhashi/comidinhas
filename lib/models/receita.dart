import 'package:comidinhas/models/application_models.dart';

class Receita {
  final String documentId;
  final String userId;
  final String nome;
  final int quantidadePessoas;
  final int tempoPreparo;
  final double? avaliacao;
  final List<String> categorias;

  final String imagem;
  final List<String> ingredientes;
  final List<String> modoPreparo;

  Receita({
    required this.documentId,
    required this.userId,
    required this.nome,
    required this.quantidadePessoas,
    required this.tempoPreparo,
    this.avaliacao,
    required this.imagem,
    required this.ingredientes,
    required this.modoPreparo,
    required this.categorias,
  });

  Map<String, dynamic> toMap() {
    return {
      'documentId': documentId,
      'userId': userId,
      'nome': nome,
      'quantidadePessoas': quantidadePessoas,
      'tempoPreparo': tempoPreparo,
      'avaliacao': avaliacao,
      'categorias': categorias,
      'imagem': imagem,
      'ingredientes': ingredientes,
      'modoPreparo': modoPreparo,
    };
  }

  factory Receita.fromMap(Map<String, dynamic> map, String documentId) {
    return Receita(
      documentId: documentId,
      userId: map['userId'],
      nome: map['nome'],
      quantidadePessoas: map['quantidadePessoas'],
      tempoPreparo: map['tempoPreparo'],
      avaliacao: double.tryParse('${map['avaliacao']}'),
      categorias: List<String>.from(map['categorias']),
      imagem: map['imagem'],
      ingredientes: List<String>.from(map['ingredientes']),
      modoPreparo: List<String>.from(map['modoPreparo']),
    );
  }
}

class ReceitaWithUser {
  final String documentId;
  final User user;
  final String nome;
  final int quantidadePessoas;
  final int tempoPreparo;
  final double? avaliacao;
  final List<String> categorias;

  final String imagem;
  final List<String> ingredientes;
  final List<String> modoPreparo;

  ReceitaWithUser({
    required this.documentId,
    required this.user,
    required this.nome,
    required this.quantidadePessoas,
    required this.tempoPreparo,
    this.avaliacao,
    required this.imagem,
    required this.ingredientes,
    required this.modoPreparo,
    required this.categorias,
  });
}
