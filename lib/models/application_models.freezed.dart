// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'application_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required String id,
      String? email,
      String? nome,
      String? image,
      List<Avaliacao>? avaliacoes,
      String? descricao,
      List<String>? favoritos,
      List<String>? receitas}) {
    return _User(
      id: id,
      email: email,
      nome: nome,
      image: image,
      avaliacoes: avaliacoes,
      descricao: descricao,
      favoritos: favoritos,
      receitas: receitas,
    );
  }

  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get nome => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  List<Avaliacao>? get avaliacoes => throw _privateConstructorUsedError;
  String? get descricao => throw _privateConstructorUsedError;
  List<String>? get favoritos => throw _privateConstructorUsedError;
  List<String>? get receitas => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String? email,
      String? nome,
      String? image,
      List<Avaliacao>? avaliacoes,
      String? descricao,
      List<String>? favoritos,
      List<String>? receitas});
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? nome = freezed,
    Object? image = freezed,
    Object? avaliacoes = freezed,
    Object? descricao = freezed,
    Object? favoritos = freezed,
    Object? receitas = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      nome: nome == freezed
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      avaliacoes: avaliacoes == freezed
          ? _value.avaliacoes
          : avaliacoes // ignore: cast_nullable_to_non_nullable
              as List<Avaliacao>?,
      descricao: descricao == freezed
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      favoritos: favoritos == freezed
          ? _value.favoritos
          : favoritos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      receitas: receitas == freezed
          ? _value.receitas
          : receitas // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String? email,
      String? nome,
      String? image,
      List<Avaliacao>? avaliacoes,
      String? descricao,
      List<String>? favoritos,
      List<String>? receitas});
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? nome = freezed,
    Object? image = freezed,
    Object? avaliacoes = freezed,
    Object? descricao = freezed,
    Object? favoritos = freezed,
    Object? receitas = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      nome: nome == freezed
          ? _value.nome
          : nome // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      avaliacoes: avaliacoes == freezed
          ? _value.avaliacoes
          : avaliacoes // ignore: cast_nullable_to_non_nullable
              as List<Avaliacao>?,
      descricao: descricao == freezed
          ? _value.descricao
          : descricao // ignore: cast_nullable_to_non_nullable
              as String?,
      favoritos: favoritos == freezed
          ? _value.favoritos
          : favoritos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      receitas: receitas == freezed
          ? _value.receitas
          : receitas // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  _$_User(
      {required this.id,
      this.email,
      this.nome,
      this.image,
      this.avaliacoes,
      this.descricao,
      this.favoritos,
      this.receitas});

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String id;
  @override
  final String? email;
  @override
  final String? nome;
  @override
  final String? image;
  @override
  final List<Avaliacao>? avaliacoes;
  @override
  final String? descricao;
  @override
  final List<String>? favoritos;
  @override
  final List<String>? receitas;

  @override
  String toString() {
    return 'User(id: $id, email: $email, nome: $nome, image: $image, avaliacoes: $avaliacoes, descricao: $descricao, favoritos: $favoritos, receitas: $receitas)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.nome, nome) ||
                const DeepCollectionEquality().equals(other.nome, nome)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.avaliacoes, avaliacoes) ||
                const DeepCollectionEquality()
                    .equals(other.avaliacoes, avaliacoes)) &&
            (identical(other.descricao, descricao) ||
                const DeepCollectionEquality()
                    .equals(other.descricao, descricao)) &&
            (identical(other.favoritos, favoritos) ||
                const DeepCollectionEquality()
                    .equals(other.favoritos, favoritos)) &&
            (identical(other.receitas, receitas) ||
                const DeepCollectionEquality()
                    .equals(other.receitas, receitas)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(nome) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(avaliacoes) ^
      const DeepCollectionEquality().hash(descricao) ^
      const DeepCollectionEquality().hash(favoritos) ^
      const DeepCollectionEquality().hash(receitas);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  factory _User(
      {required String id,
      String? email,
      String? nome,
      String? image,
      List<Avaliacao>? avaliacoes,
      String? descricao,
      List<String>? favoritos,
      List<String>? receitas}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get nome => throw _privateConstructorUsedError;
  @override
  String? get image => throw _privateConstructorUsedError;
  @override
  List<Avaliacao>? get avaliacoes => throw _privateConstructorUsedError;
  @override
  String? get descricao => throw _privateConstructorUsedError;
  @override
  List<String>? get favoritos => throw _privateConstructorUsedError;
  @override
  List<String>? get receitas => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
