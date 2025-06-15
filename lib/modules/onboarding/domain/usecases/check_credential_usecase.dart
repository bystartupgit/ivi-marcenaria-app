import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:marcenaria/modules/login/domain/entities/auth_entity.dart';

class CheckCredentialUseCase {

  final String key = "auth";
  final FlutterSecureStorage storage = Modular.get<FlutterSecureStorage>();

  Future<AuthEntity?> call() async {

    String? auth = await storage.read(key: key);

    if (auth != null) {
      return AuthEntity.fromLocal(jsonDecode(auth));
    }

    return null;
  }
}