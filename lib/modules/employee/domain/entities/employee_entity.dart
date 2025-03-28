import 'package:marcenaria/core/data/entities/profile_entity.dart';
import 'package:marcenaria/modules/employee/domain/mappers/employee_mapper.dart';
import 'package:marcenaria/modules/login/domain/enums/user_type_enum.dart';

class EmployeeEntity extends ProfileEntity {

  final List<String> functions;

  EmployeeEntity({
    required this.functions,
    required super.id,
    required super.name,
    required super.email,
    required super.enable,
    super.type = UserType.prestador,
    required super.cpf,
    required super.phone,
    super.image
  });

  factory EmployeeEntity.fromMap(Map<String,dynamic> map) {
    print(map["midia_perfil"]["nome_arquivo"]);
    return EmployeeEntity(
        id: map[EmployeeMapper.profile][EmployeeMapper.employeeID],
        name: map[EmployeeMapper.user][EmployeeMapper.name],
        email: map[EmployeeMapper.user][EmployeeMapper.email],
        enable: map[EmployeeMapper.user][EmployeeMapper.status],
        cpf: map[EmployeeMapper.user][EmployeeMapper.cpf],
        phone: map[EmployeeMapper.user][EmployeeMapper.phone],
        image: map["midia_perfil"]["nome_arquivo"],
        functions: map[EmployeeMapper.profile][EmployeeMapper.funcoes] == null
            ? const []
            : List.from(map[EmployeeMapper.profile][EmployeeMapper.funcoes])
    );
  }

  @override
  ProfileEntity copyWith({ String? name, String? email, String? cpf, String? phone }) =>
      EmployeeEntity(
          type: type,
          functions: functions,
          name: name ?? this.name,
          email: email ?? this.email,
          enable: enable,
          cpf: cpf ?? this.cpf,
          id: id,
          image: image,
          phone: phone ?? this.phone);

}