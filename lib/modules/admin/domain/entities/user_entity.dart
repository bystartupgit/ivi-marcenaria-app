import 'package:marcenaria/modules/login/domain/enums/user_type_enum.dart';

class UserEntity {
  final int id;
  final String name;
  final String email;
  final UserType type;

  final String? image;

  UserEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.type,
      this.image});

  factory UserEntity.fromMap(Map<String, dynamic> map) => UserEntity(
      id: map["id_usuario"],
      name: map["nome"],
      email: map["email"],
      type: UserType.values.byName(map["tipo_usuario"]),
      image: map["midiaPerfil"] == null
          ? null
          : map["midiaPerfil"]["nome_arquivo"]);
}
