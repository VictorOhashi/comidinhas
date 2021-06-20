import 'package:comidinhas/models/application_models.dart';

abstract class ReceitaProps {
  final String? documentId;
  final String nome;
  final int quantidadePessoas;
  final int tempoPreparo;
  final double? avaliacao;
  final List<String> categorias;

  final String imagem;
  final List<String> ingredientes;
  final List<String> modoPreparo;

  ReceitaProps(
    this.documentId,
    this.nome,
    this.quantidadePessoas,
    this.tempoPreparo,
    this.avaliacao,
    this.imagem,
    this.ingredientes,
    this.modoPreparo,
    this.categorias,
  );
}

class Receita extends ReceitaProps {
  final String userId;

  Receita({
    required this.userId,
    required String nome,
    required int quantidadePessoas,
    required int tempoPreparo,
    required List<String> categorias,
    required String imagem,
    required List<String> ingredientes,
    required List<String> modoPreparo,
    String? documentId,
    double? avaliacao,
  }) : super(
          documentId,
          nome,
          quantidadePessoas,
          tempoPreparo,
          avaliacao,
          imagem,
          ingredientes,
          modoPreparo,
          categorias,
        );

  Map<String, dynamic> toMap() {
    return {
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
      avaliacao: (map['avaliacao'] as num).toDouble(),
      categorias: List<String>.from(map['categorias']),
      imagem: map['imagem'],
      ingredientes: List<String>.from(map['ingredientes']),
      modoPreparo: List<String>.from(map['modoPreparo']),
    );
  }
}

class ReceitaWithUser extends ReceitaProps {
  final User user;

  ReceitaWithUser({
    required this.user,
    required String documentId,
    required String nome,
    required int quantidadePessoas,
    required int tempoPreparo,
    double? avaliacao,
    required List<String> categorias,
    required String imagem,
    required List<String> ingredientes,
    required List<String> modoPreparo,
  }) : super(
          documentId,
          nome,
          quantidadePessoas,
          tempoPreparo,
          avaliacao,
          imagem,
          ingredientes,
          modoPreparo,
          categorias,
        );

  Receita get receita => Receita(
        documentId: this.documentId,
        userId: this.user.id,
        nome: this.nome,
        quantidadePessoas: this.quantidadePessoas,
        tempoPreparo: this.tempoPreparo,
        avaliacao: this.avaliacao,
        imagem: this.imagem,
        ingredientes: this.ingredientes,
        modoPreparo: this.modoPreparo,
        categorias: this.categorias,
      );
}
