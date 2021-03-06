import 'package:freezed_annotation/freezed_annotation.dart';

import 'avaliacao.dart';

part 'application_models.freezed.dart';
part 'application_models.g.dart';

@freezed
class User with _$User {
  factory User({
    required String id,
    String? email,
    String? nome,
    String? image,
    List<Avaliacao>? avaliacoes,
    String? descricao,
    List<String>? favoritos,
    List<String>? receitas,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
