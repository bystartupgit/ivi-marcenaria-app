



import 'package:marcenaria/modules/login/domain/entities/auth_entity.dart';
import 'package:marcenaria/modules/login/external/login_datasource.dart';

class LoginUseCase {

  final LoginDataSource datasource;

  LoginUseCase({required this.datasource});

  Future<(String, AuthEntity?)> call(String email, String password) async =>
      await datasource.login(email: email, password: password);

}