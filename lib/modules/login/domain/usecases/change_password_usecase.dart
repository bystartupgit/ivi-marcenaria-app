import '../../external/login_datasource.dart';

class ChangePasswordUsecase {

  final LoginDataSource datasource;

  ChangePasswordUsecase({required this.datasource});

  Future<(String,bool)> call({ required String code }) async =>
      await datasource.validateToken(code: code);

}