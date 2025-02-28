

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:marcenaria/modules/login/domain/entities/auth_entity.dart';
import 'package:marcenaria/modules/login/domain/mappers/auth_mapper.dart';

import '../domain/dto/register_dto.dart';

class LoginDataSource {

    final String enviroment = "http://92.112.177.245:5000";

    Future<(String, bool)> registerUser({required RegisterDTO dto}) async {

      Uri url = Uri.parse("$enviroment/api/usuarios/registrar");

      Map<String,String> headers = {"Content-Type": "application/json"};

      Map<String,dynamic> body = dto.toMap();

      print(body);

      Response response = await post(url, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 8));

      print(response.body);

      return ("",true);

    }

    Future<(String, AuthEntity?)> login({required String email, required String password}) async {

      Uri url = Uri.parse("$enviroment/api/usuarios/login");

      Map<String,String> headers = {"Content-Type": "application/json"};

      Map<String,dynamic> body ={"email":email, "senha": password };

      try {

        Response response = await post(
            url, headers: headers, body: jsonEncode(body))
            .timeout(const Duration(seconds: 8));

        dynamic data = jsonDecode(response.body);

        final String message = data[AuthMapper.message];

        if(response.statusCode == 200) {
          return (message, AuthEntity.fromMap(data));
        } else { return (message, null); }

      } catch(e) { return (e.toString(), null); }

    }

}