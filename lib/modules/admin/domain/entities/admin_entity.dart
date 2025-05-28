import 'package:marcenaria/modules/admin/domain/mappers/admin_mapper.dart';

import '../../../../../core/data/entities/profile_entity.dart';
import '../../../login/domain/enums/user_type_enum.dart';

class AdminEntity extends ProfileEntity {
  AdminEntity(
      {required super.id,
      required super.name,
      required super.email,
      required super.enable,
      super.type = UserType.administrador,
      required super.cpf,
      required super.phone,
      super.image});

  factory AdminEntity.fromMap(Map<String, dynamic> map) => AdminEntity(
      id: map[AdminMapper.profile][AdminMapper.adminID],
      name: map[AdminMapper.user][AdminMapper.name],
      email: map[AdminMapper.user][AdminMapper.email],
      enable: map[AdminMapper.user][AdminMapper.status],
      cpf: map[AdminMapper.user][AdminMapper.cpf],
      phone: map[AdminMapper.user][AdminMapper.phone],
      image: map[AdminMapper.user][AdminMapper.image]);

  @override
  AdminEntity copyWith(
          {String? name, String? email, String? cpf, String? phone}) =>
      AdminEntity(
          type: type,
          name: name ?? this.name,
          email: email ?? this.email,
          enable: enable,
          cpf: cpf ?? this.cpf,
          id: id,
          image: image,
          phone: phone ?? this.phone);
}
