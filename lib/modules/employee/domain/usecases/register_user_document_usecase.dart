


import 'dart:io';

import '../../external/user_datasource.dart';

class RegisterUserDocumentUsecase {

  final UserDataSource datasource;

  RegisterUserDocumentUsecase({required this.datasource});

  Future<bool> call({required int employeeID, required String name, required File photo, required String description}) async =>
      await datasource.registerDocumentMedia(photo: photo, employeeID: employeeID, name: name,description: description );
}