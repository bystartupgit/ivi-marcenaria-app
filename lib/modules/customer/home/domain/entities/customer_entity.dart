


import 'package:marcenaria/core/data/entities/profile_entity.dart';
import 'package:marcenaria/modules/customer/home/domain/mappers/customer_mapper.dart';

import '../../../../login/domain/enums/user_type_enum.dart';

class CustomerEntity extends ProfileEntity {

  CustomerEntity({
    required super.id,
    required super.name,
    required super.email,
    required super.enable,
    super.type = UserType.cliente,
    required super.cpf,
    required super.phone,
    super.image
  });

  factory CustomerEntity.fromMap(Map<String,dynamic> map) =>
      CustomerEntity(
          id: map[CustomerMapper.profile][CustomerMapper.customerID],
          name: map[CustomerMapper.user][CustomerMapper.name],
          email: map[CustomerMapper.user][CustomerMapper.email],
          enable: map[CustomerMapper.user][CustomerMapper.status],
          cpf: map[CustomerMapper.user][CustomerMapper.cpf],
          phone: map[CustomerMapper.user][CustomerMapper.phone],
          image: map["midia_perfil"]?["caminho"]
      );

  @override
  ProfileEntity copyWith({ String? name, String? email, String? cpf, String? phone }) =>
      CustomerEntity(
          type: type,
          name: name ?? this.name,
          email: email ?? this.email,
          enable: enable,
          cpf: cpf ?? this.cpf,
          id: id,
          image: image,
          phone: phone ?? this.phone);

}