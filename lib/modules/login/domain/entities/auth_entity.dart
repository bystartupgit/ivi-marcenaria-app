import 'package:marcenaria/modules/login/domain/enums/user_type_enum.dart';
import 'package:marcenaria/modules/login/domain/mappers/auth_mapper.dart';

class AuthEntity {
  final int id;
  final String email;
  final String token;
  final UserType type;

  AuthEntity(
      {required this.token,
      required this.type,
      required this.id,
      required this.email});

  factory AuthEntity.fromMap(Map<String, dynamic> map) => AuthEntity(
      token: map[AuthMapper.token],
      type: UserType.values.byName(map[AuthMapper.user][AuthMapper.type]),
      id: map[AuthMapper.user][AuthMapper.id],
      email: map[AuthMapper.user][AuthMapper.email]);

  factory AuthEntity.fromLocal(Map<String,dynamic> map) =>
      AuthEntity(
          token: map[AuthMapper.token],
          type: UserType.values.byName(map[AuthMapper.type]),
          id: map[AuthMapper.id],
          email: map[AuthMapper.email]);

  toMap() => {
    AuthMapper.token: token,
    AuthMapper.id: id,
    AuthMapper.email: email,
    AuthMapper.type: type.name
  };
}
