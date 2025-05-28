import 'dart:io';

import 'package:marcenaria/modules/customer/home/service/domain/dto/service_attachment_dto.dart';

import '../../external/service_datasource.dart';

class UploadMediaServiceUseCase {
  final ServiceDataSource datasource;

  UploadMediaServiceUseCase({required this.datasource});

  Future<(String, bool)> call(
          ServiceAttachmentDTO attachment, File media) async =>
      await datasource.uploadMedia(attachment, media);
}
