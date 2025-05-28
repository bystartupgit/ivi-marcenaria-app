import 'package:marcenaria/modules/login/external/login_datasource.dart';

class ValidateCodeUsecase {
  final LoginDataSource datasource;

  ValidateCodeUsecase({required this.datasource});

  Future<(String, bool)> call({required String code}) async =>
      await datasource.validateToken(code: code);
}
