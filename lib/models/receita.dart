class Receita {
  final String? documentId;
  final String userId;
  final String nome;
  final int quantidadePessoas;
  final int tempoPreparo;
  final int? avaliacao;

  final List<String> imagens;
  final List<String> ingredientes;
  final List<String> modoPreparo;

  Receita({
    this.documentId,
    required this.userId,
    required this.nome,
    required this.quantidadePessoas,
    required this.tempoPreparo,
    this.avaliacao,
    required this.imagens,
    required this.ingredientes,
    required this.modoPreparo,
  });

  Map<String, dynamic> toMap() => {
        'documentId': documentId,
        'userId': userId,
        'nome': nome,
        'quantidadePessoas': quantidadePessoas,
        'tempoPreparo': tempoPreparo,
        'avaliacao': avaliacao,
        'imagens': imagens,
        'ingredientes': ingredientes,
        'modoPreparo': modoPreparo,
      };

  factory Receita.fromMap(Map<String, dynamic> map, String documentId) =>
      Receita(
        documentId: documentId,
        userId: map['userId'],
        nome: map['nome'],
        quantidadePessoas: map['quantidadePessoas'],
        tempoPreparo: map['tempoPreparo'],
        avaliacao: map['avaliacao'],
        imagens: List<String>.from(map['imagens']),
        ingredientes: List<String>.from(map['ingredientes']),
        modoPreparo: List<String>.from(map['modoPreparo']),
      );
}
