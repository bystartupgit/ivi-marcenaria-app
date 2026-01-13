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
      this.cpf = "",
      required this.phone,
      required this.type,
      this.functions = const []});

  toMap() {
    //Solução temporaria para o backend aceitar CPF opcional, acerta com a gestão.
    // Se CPF estiver vazio, envia sequência de zeros para o banco aceitar
    // TODO: Solução temporária - ajustar backend para aceitar CPF opcional
    String cpfValue = cpf.isEmpty 
        ? "00000000000" 
        : cpf.replaceAll(".", "").replaceAll("-", "");
    
    Map<String, dynamic> map = {
      RegisterParamsMapper.name: name,
      RegisterParamsMapper.email: email,
      RegisterParamsMapper.password: password,
      RegisterParamsMapper.cpf: cpfValue,
      RegisterParamsMapper.phone: phone,
      RegisterParamsMapper.type: type.name,
      RegisterParamsMapper.functions: functions
    };  
    return map;
  }
}
