import '../../external/login_datasource.dart';

class ResetPasswordUsecase {
  final LoginDataSource datasource;

  ResetPasswordUsecase({required this.datasource});

  Future<(String, bool)> call(
          {required String code, required String password}) async =>
      await datasource.resetPassword(code: code, password: password);
}
