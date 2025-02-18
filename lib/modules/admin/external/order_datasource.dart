

import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_without_proposal_entity.dart';
import 'package:marcenaria/modules/admin/domain/mappers/order_mapper.dart';

import '../../../../core/data/store/core_store.dart';

class OrderDataSource {

  final String enviroment = "http://92.112.177.245:5000";

  Future<List<OrderEntity>> getWaitingProposal({ required int page, required int limit }) async {

    Uri url = Uri.parse("$enviroment/api/pedidos/listar/aguardando-orcamento");

    String? token = Modular.get<CoreStore>().auth?.token;

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
        List<dynamic> orders = data[OrderMapper.orders];

        if (orders.isNotEmpty) { return orders.map((e) => OrderEntity.fromMap(e)).toList(); }
        else { return []; }
      } else {
        return [];
      }

  }

  Future<OrderWithoutProposalEntity?> getOrderWithoutProposal({required int orderID}) async {

    Uri url = Uri.parse("$enviroment/api/pedidos/unico");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = { "id" : orderID };

    Response response = await post(
        url, headers: headers, body: jsonEncode(body))
        .timeout(const Duration(seconds: 8));

    if(response.statusCode == 200) {

      Map<String, dynamic> data = jsonDecode(response.body);

      return OrderWithoutProposalEntity.fromMap(data[OrderMapper.order]);
    } else { return null; }
  }


}