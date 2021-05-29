// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'application_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as String,
    email: json['email'] as String?,
    nome: json['nome'] as String?,
    image: json['image'] as String?,
    avaliacao: json['avaliacao'] as int?,
    descricao: json['descricao'] as String?,
    favoritos:
        (json['favoritos'] as List<dynamic>?)?.map((e) => e as String).toList(),
    receitas:
        (json['receitas'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'nome': instance.nome,
      'image': instance.image,
      'avaliacao': instance.avaliacao,
      'descricao': instance.descricao,
      'favoritos': instance.favoritos,
      'receitas': instance.receitas,
    };
