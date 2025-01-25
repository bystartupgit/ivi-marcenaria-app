

import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:marcenaria/modules/login/domain/entities/auth_entity.dart';
import 'package:marcenaria/modules/login/domain/mappers/auth_mapper.dart';

import '../domain/dto/register_dto.dart';

class LoginDataSource {

    final String enviroment = "http://92.112.177.245:5000";

    Future<(String, bool)> registerUser({required RegisterDTO dto}) async {

      Uri url = Uri.parse("$enviroment/api/pedidos/criar");
      Uri url2 = Uri.parse("$enviroment/api/usuarios/login");

      print(jsonEncode(dto.toMap()));



      //Response response2 = await post(url2, headers: {"Content-Type": "application/json"}, body:
      //jsonEncode({
        //"email": "andreyprestador@gmail.com",
       // "senha": "Andrey123",
     // }));

      final token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZF91c3VhcmlvIjo5LCJ0aXBvX3VzdWFyaW8iOiJjbGllbnRlIiwiaWF0IjoxNzM3NzAzNzk2LCJleHAiOjE3Mzc3MDczOTZ9.EtVgbrLrysIVQhayAYq1dABcK7x5tfBA12D_lUfSnpo";

     Response response = await post(url,
          headers: {
       "Content-Type": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZF91c3VhcmlvIjo5LCJ0aXBvX3VzdWFyaW8iOiJjbGllbnRlIiwiaWF0IjoxNzM3NzAzNzk2LCJleHAiOjE3Mzc3MDczOTZ9.EtVgbrLrysIVQhayAYq1dABcK7x5tfBA12D_lUfSnpo"},
          body: jsonEncode({
          "id_cliente": 1,
          "titulo": "Mesa de Jantar",
          "contato": true,
          "ambientes": "",
          "descricao": "Mesa de Jantar com 6 lugares."
          }));



      log(response.body.toString());

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