import 'dart:io';

import '../../external/user_datasource.dart';

class RegisterUserPhotoUsecase {
  final UserDataSource datasource;

  RegisterUserPhotoUsecase({required this.datasource});

  Future<bool> call(
          {required int employeeID,
          required String name,
          required File photo}) async =>
      await datasource.registerMedia(
          photo: photo, employeeID: employeeID, name: name);
}
