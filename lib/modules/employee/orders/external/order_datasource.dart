import 'dart:convert';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/admin/domain/mappers/order_mapper.dart';

import '../../../../core/data/store/core_store.dart';
import '../../../admin/domain/entities/proposal_entity.dart';

class OrderDataSource {

  final String enviroment = "http://92.112.177.245:5000";
  final String ftp = "92.112.177.245";

  Future<List<OrderEntity>> getWaitingInterestOrders({required int employeeID, required int page, required int limit }) async {

    String? token = Modular.get<CoreStore>().auth?.token;

    Uri url = Uri.parse("$enviroment/api/pedidos/prestador/$employeeID/selecionado-aceitar");

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

        List<dynamic> result = data["propostasInteressadas"];

        if(result.isEmpty) { return []; }
        else { return result.map((e) => OrderEntity.fromMap(e[OrderMapper.proposal][OrderMapper.order])).toList();  }

      } else { return []; }
  }

  Future<List<OrderEntity>> getOrderNotStarted({required int employeeID, required int page, required int limit }) async {
    String? token = Modular.get<CoreStore>().auth?.token;

    Uri url = Uri.parse("$enviroment/api/pedidos/prestador/$employeeID/sem-execucao");

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

      print(data);

      List<dynamic> result = data["pedidosSemExecucao"];

      if(result.isEmpty) { return []; }
      else { return result.map((e) => OrderEntity.fromMap(e)).toList();  }

    } else { return []; }
  }

  Future<(OrderEntity?,ProposalEntity?)> getOrderDetails({required int orderID}) async {

    Uri url = Uri.parse("$enviroment/api/pedidos/unico");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = { "id" : orderID };

    try{

      Response response = await post(
          url, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 8));

      if(response.statusCode == 200) {

        Map<String, dynamic> data = jsonDecode(response.body);

        final OrderEntity order = OrderEntity.fromMap(data[OrderMapper.order]);
        final ProposalEntity proposal = ProposalEntity.fromJson(data[OrderMapper.proposal]);

        return (order,proposal);

      } else { return (null,null); } } catch(e) { return (null,null); }
  }

  Future<bool> registerInteresting({required int employeeID, required String status, required proposalID }) async {

    Uri url = Uri.parse("$enviroment/api/propostas/$proposalID/interesse");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = { "id_prestador": employeeID, "status_interesse": status };

    try{

      Response response = await post(
          url, headers: headers, body: jsonEncode(body)).timeout(const Duration(seconds: 8));

      if(response.statusCode == 201) {

       return true;

      } else { return false; } } catch(e) { return false; }
  }

  Future<bool> startService({required int proposalID}) async {

    Uri url = Uri.parse("$enviroment/api/propostas/$proposalID/iniciar-execucao");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = {};

    try{

      Response response = await post(url, headers: headers, body: jsonEncode(body)).timeout(const Duration(seconds: 8));

      if(response.statusCode == 200) {

        return true;

      } else { return false; } } catch(e) { return false; }


  }
}