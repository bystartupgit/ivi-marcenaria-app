import '../../../modules/login/domain/enums/user_type_enum.dart';

abstract class ProfileEntity {
  final int id;

  final String name;
  final String email;
  final UserType type;
  final bool enable;
  final String cpf;
  final String phone;
  final String? image;

  ProfileEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.type,
      required this.enable,
      required this.cpf,
      required this.phone,
      required this.image});

  ProfileEntity copyWith(
      {String? name, String? email, String? cpf, String? phone});
}
