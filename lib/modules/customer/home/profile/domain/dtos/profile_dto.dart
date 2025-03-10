

import 'package:marcenaria/modules/customer/home/profile/domain/mappers/profile_mappers.dart';

class ProfileDTO {

  final String name;
  final String email;
  final String cpf;
  final String phone;
  final String? image;

  ProfileDTO({required this.name,
    this.image, required this.email, this.cpf = "", this.phone = "" });

  toMap() => {
    ProfileMappers.name: name,
    ProfileMappers.email: email,
    ProfileMappers.cpf: cpf.isEmpty? "" : cpf.replaceAll(".", "").replaceAll("-", ""),
    ProfileMappers.phone: phone,
  };


}
