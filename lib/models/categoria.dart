class Categoria {
  final String? documentId;
  final String? descricao;
  final String? icon;
  final int? color;

  Categoria({
    required this.documentId,
    required this.descricao,
    required this.icon,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      'descricao': descricao,
      'icon': icon,
    };
  }

  factory Categoria.fromMap(Map<String, dynamic> map, String documentId) {
    return Categoria(
      documentId: map['documentId'],
      descricao: map['descricao'],
      color: map['color'],
      icon: map['icon'],
    );
  }
}
