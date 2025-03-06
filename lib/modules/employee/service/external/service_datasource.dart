import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';

import '../../../../core/data/store/core_store.dart';
import '../../../admin/domain/entities/order_entity.dart';
import '../../../admin/domain/mappers/order_mapper.dart';

class ServiceDataSource {

  final String enviroment = "http://92.112.177.245:5000";
  final String ftp = "92.112.177.245";

  Future<List<OrderEntity>> getServiceProduction({required int employeeID, required int page, required int limit }) async {

    String? token = Modular.get<CoreStore>().auth?.token;

    Uri url = Uri.parse("$enviroment/api/pedidos/prestador/$employeeID/em-execucao");

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = { "page" : page, "limit" : limit };

    try{

    Response response = await post(
        url, headers: headers, body: jsonEncode(body))
        .timeout(const Duration(seconds: 8));

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {

      List<dynamic> result = data["pedidosEmExecucao"];

      print(result.toString());

      if(result.isNotEmpty) { return result.map((e) => OrderEntity.fromMap(e[OrderMapper.proposal][OrderMapper.order])).toList(); }
      else { return []; }

    } else { return []; } } catch(e) { return []; }
  }

  Future<List<OrderEntity>> getServiceFinish({required int employeeID, required int page, required int limit }) async {

    String? token = Modular.get<CoreStore>().auth?.token;

    Uri url = Uri.parse("$enviroment/api/pedidos/prestador/$employeeID/concluidos");

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = { "page" : page, "limit" : limit };

    Response response = await post(
        url, headers: headers, body: jsonEncode(body))
        .timeout(const Duration(seconds: 8));

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {

      List<dynamic> result = data["pedidosConcluidos"];

      print(result.toString());

      if(result.isNotEmpty) { return result.map((e) => OrderEntity.fromMap(e)).toList(); }
      else { return []; }

    } else { return []; }
  }

  Future<(String,bool)> finishService({required int proposalID}) async {

    String? token = Modular.get<CoreStore>().auth?.token;

    Uri url = Uri.parse("$enviroment/api/propostas/$proposalID/conclusao-execucao");

    Map<String,String> headers = {
    "Content-Type": "application/json",
    "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = {};

    Response response = await post(
    url, headers: headers, body: jsonEncode(body))
        .timeout(const Duration(seconds: 8));

    Map<String, dynamic> data = jsonDecode(response.body);

    String message = data["message"];

    if (response.statusCode == 200) { return (message,true);
    } else { return (message, false); }
  }

}