import 'package:marcenaria/modules/login/domain/enums/user_type_enum.dart';
import 'package:marcenaria/modules/login/domain/mappers/register_parameters_mapper.dart';

class RegisterDTO {
  final String name;
  final String email;
  final String password;
  final String cpf;
  final String phone;
  final UserType type;

  final List<String> functions;

  RegisterDTO(
      {required this.name,
      required this.email,
      required this.password,
      required this.cpf,
      required this.phone,
      required this.type,
      this.functions = const []});

  toMap() => {
        RegisterParamsMapper.name: name,
        RegisterParamsMapper.email: email,
        RegisterParamsMapper.password: password,
        RegisterParamsMapper.cpf: cpf.replaceAll(".", "").replaceAll("-", ""),
        RegisterParamsMapper.phone: phone,
        RegisterParamsMapper.type: type.name,
        RegisterParamsMapper.functions: functions
      };
}
