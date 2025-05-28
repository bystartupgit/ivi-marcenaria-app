import 'package:marcenaria/modules/login/domain/dto/register_dto.dart';
import 'package:marcenaria/modules/login/external/login_datasource.dart';

class RegisterUseCase {
  final LoginDataSource datasource;

  RegisterUseCase({required this.datasource});

  Future<(String, bool)> call({required RegisterDTO dto}) async =>
      await datasource.registerUser(dto: dto);
}
