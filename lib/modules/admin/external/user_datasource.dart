


import 'dart:convert';
import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/modules/admin/domain/entities/admin_entity.dart';
import 'package:marcenaria/modules/login/domain/enums/user_type_enum.dart';


class UserDataSource {

  final String enviroment = "http://92.112.177.245:5000";

  Future<AdminEntity?> getUserDetails({required int id, required UserType type}) async {

    Uri url = Uri.parse("$enviroment/api/usuarios/detalhes");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = { "id": id, "tipo": "administrador" };

      Response response = await post(
          url, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 8));

      Map<String,dynamic> data = jsonDecode(response.body);

      if(response.statusCode == 200) { return AdminEntity.fromMap(data); }

      else { return null; }

  }
}