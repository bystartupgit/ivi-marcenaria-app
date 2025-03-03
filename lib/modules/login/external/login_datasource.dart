

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

      try{

      Response response = await post(url, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 8));

      final String message = jsonDecode(response.body)["message"];

      if(response.statusCode == 201) {

        final data = jsonDecode(response.body);

        if(message == AuthMapper.success) { return ("", true); }

        else { return (message, false); }

      } else { return (message, false); }

      }catch(e) { return ("Não foi possível realizar o cadastro. Tente novamente mais tarde", false); }
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

    Future<(String, bool)> sendResetEmail({required String email}) async {

      Uri url = Uri.parse("$enviroment/api/usuarios/recoverPassword");

      Map<String,String> headers = {"Content-Type": "application/json"};

      Map<String,dynamic> body ={ "email":email };

      try {

        Response response = await post(
            url, headers: headers, body: jsonEncode(body))
            .timeout(const Duration(seconds: 8));

        dynamic data = jsonDecode(response.body);

        final String message = data[AuthMapper.message];

        if(response.statusCode == 200) {
          return (message, true);
        } else { return (message, false); }

      } catch(e) { return (e.toString(), false); }

    }

    Future<(String, bool)> validateToken({required String code}) async {

      Uri url = Uri.parse("$enviroment/api/usuarios/validateToken");

      Map<String,String> headers = {"Content-Type": "application/json"};

      Map<String,dynamic> body = { "token": code };

      try {

        Response response = await post(
            url, headers: headers, body: jsonEncode(body))
            .timeout(const Duration(seconds: 8));

        dynamic data = jsonDecode(response.body);

        final String message = data[AuthMapper.message];

        print(message);

        if(response.statusCode == 200) {
          return (message, true);
        } else { return (message, false); }

      } catch(e) { return (e.toString(), false); }

    }

}