import 'dart:convert';
import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/modules/customer/home/domain/entities/customer_entity.dart';

import '../../../login/domain/enums/user_type_enum.dart';

class UserDataSource {
  final String enviroment = "http://92.112.177.245:5000";

  Future<CustomerEntity?> getUserDetails(
      {required int id, required UserType type}) async {
    Uri url = Uri.parse("$enviroment/api/usuarios/detalhes");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {"id": id, "tipo": type.name};

    Response response =
        await post(url, headers: headers, body: jsonEncode(body))
            .timeout(const Duration(seconds: 8));

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return CustomerEntity.fromMap(data);
    } else {
      return null;
    }
  }

  Future<bool> registerFirebaseToken(
      {required String fcmToken, required int userID}) async {
    Uri url = Uri.parse("$enviroment/api/usuarios/validateToken");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {"id_usuario": userID, "token": fcmToken};

    try {
      Response response =
          await post(url, headers: headers, body: jsonEncode(body))
              .timeout(const Duration(seconds: 8));

      dynamic data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
