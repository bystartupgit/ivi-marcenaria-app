import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class GalleryPermission {
  Future<PermissionStatus> call() async {
    if (Platform.isAndroid) {
      AndroidDeviceInfo informations = await DeviceInfoPlugin().androidInfo;

      if (informations.version.sdkInt <= 32) {
        return await Permission.storage.request();
      } else {
        return await Permission.photos.request();
      }
    }
    return Permission.photos.request();
  }
}
