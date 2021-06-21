class Avaliacao {
  final String id;
  final double value;

  Avaliacao({
    required this.id,
    required this.value,
  });

  factory Avaliacao.fromJson(Map<String, dynamic> json) {
    return Avaliacao(id: json['id'], value: (json['value'] as num).toDouble());
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "value": this.value,
    };
  }
}
