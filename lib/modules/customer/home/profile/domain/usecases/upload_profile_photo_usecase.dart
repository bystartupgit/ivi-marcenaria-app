import 'dart:io';

import '../../external/profile_datasource.dart';

class UploadProfilePhotoUsecase {
  final ProfileDatasource datasource;

  UploadProfilePhotoUsecase({required this.datasource});

  Future<bool> call(
          {required int customerID,
          required String name,
          required File photo}) async =>
      await datasource.registerMedia(
          photo: photo, customerID: customerID, name: name);
}
