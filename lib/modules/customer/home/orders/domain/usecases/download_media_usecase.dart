import 'dart:io';

import 'package:marcenaria/modules/customer/home/orders/external/order_datasource.dart';

class DownloadMediaUsecase {
  final OrderDataSource datasource;

  DownloadMediaUsecase({required this.datasource});

  Future<File?> call({required String name, required String path}) async =>
      datasource.downloadMedia(name: name, path: path);
}
