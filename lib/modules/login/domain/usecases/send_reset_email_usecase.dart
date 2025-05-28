import 'package:marcenaria/modules/login/external/login_datasource.dart';

class SendResetEmailUsecase {
  final LoginDataSource datasource;

  SendResetEmailUsecase({required this.datasource});

  Future<(String, bool)> call({required String email}) async =>
      await datasource.sendResetEmail(email: email);
}
