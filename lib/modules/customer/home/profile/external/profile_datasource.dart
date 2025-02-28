

import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:marcenaria/modules/customer/home/profile/domain/mappers/profile_mappers.dart';

import '../../../../../core/data/store/core_store.dart';
import '../domain/dtos/profile_dto.dart';

class ProfileDatasource {

  final String enviroment = "http://92.112.177.245:5000";

  Future<bool> updateProfile({required int userID, required ProfileDTO dto}) async {

    Uri url = Uri.parse("$enviroment/api/usuarios/update/$userID");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = dto.toMap();

    try {

      Response response = await post(
          url, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 8));

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data[ProfileMappers.message] == ProfileMappers.successMessage;
      }

      else {
        return false;
      }

    } catch(e) { return false; }

  }


}