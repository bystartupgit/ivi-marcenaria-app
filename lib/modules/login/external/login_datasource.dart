

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import '../domain/dto/register_dto.dart';

class LoginDataSource {

    final String enviroment = "http://92.112.177.245:5000";

    Future<(String,bool)> registerUser({required RegisterDTO dto}) async {

      Uri url = Uri.parse("$enviroment/api/usuarios/registrar");

      print("b");

      print(jsonEncode(dto.toMap()));

      Response response = await post(url,
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({"nome":"Andrey","email":"andreysales24@gmail.com","senha":"Andrey123",
            "cpf":"01837363200","telefone":"(41) 99549-1757","tipo_usuario":"prestador"}));

      log(response.body.toString());

      return ("",true);


    }

}