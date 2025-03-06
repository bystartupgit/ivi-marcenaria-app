

import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:marcenaria/modules/admin/domain/entities/employee_user_entity.dart';
import 'package:marcenaria/modules/admin/domain/mappers/employee_user_mapper.dart';
import 'package:marcenaria/modules/employee/domain/mappers/employee_mapper.dart';

import '../../../core/data/store/core_store.dart';
import '../../employee/domain/entities/employee_entity.dart';

class RoleDataSource {

  final String enviroment = "http://92.112.177.245:5000";


  Future<List<EmployeeUserEntity>> getEmployees({ required int page, required int limit, String name = "" }) async {

    Uri url = Uri.parse("$enviroment/api/prestadores/");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = { "page" : page, "limit" : limit, "nome": name }
      ..removeWhere((key,value) => value is String && value.isEmpty);

    print(body);

    Response response = await post(
        url, headers: headers, body: jsonEncode(body))
        .timeout(const Duration(seconds: 8));

    Map<String, dynamic> data = jsonDecode(response.body);

    print(data);

    if (response.statusCode == 200) {

      List<dynamic> result = data[EmployeeUserMapper.employees];

      if(result.isNotEmpty) { return result.map((e) => EmployeeUserEntity.fromMap(e)).toList(); }
      else { return []; }

    } else { return []; }
  }

}
