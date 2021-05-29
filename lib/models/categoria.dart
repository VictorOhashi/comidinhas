class Categoria {
  final String id;
  final String descricao;
  final String icon;

  Categoria({
    required this.id,
    required this.descricao,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
      'icon': icon,
    };
  }

  factory Categoria.fromMap(Map<String, dynamic> map) {
    return Categoria(
      id: map['id'],
      descricao: map['descricao'],
      icon: map['icon'],
    );
  }
}
