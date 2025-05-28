import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/mappers/order_mapper.dart';

import '../../../../../core/data/store/core_store.dart';

class ProposalDataSource {
  final String enviroment = "http://92.112.177.245:5000";

  Future<List<OrderEntity>> getProductionOrders(
      {required int customerID, required int page, required int limit}) async {
    String? token = Modular.get<CoreStore>().auth?.token;

    Uri url =
        Uri.parse("$enviroment/api/pedidos/cliente/$customerID/em-producao");

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {"page": page, "limit": limit};

    Response response =
        await post(url, headers: headers, body: jsonEncode(body))
            .timeout(const Duration(seconds: 8));

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<dynamic> orders = data[OrderMapper.orders];

      if (orders.isNotEmpty) {
        return orders.map((e) => OrderEntity.fromMap(e)).toList();
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  Future<List<OrderEntity>> getFinishOrders(
      {required int customerID, required int page, required int limit}) async {
    String? token = Modular.get<CoreStore>().auth?.token;

    Uri url =
        Uri.parse("$enviroment/api/pedidos/cliente/$customerID/concluidos");

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {"page": page, "limit": limit};

    Response response =
        await post(url, headers: headers, body: jsonEncode(body))
            .timeout(const Duration(seconds: 8));

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<dynamic> orders = data[OrderMapper.orders];

      if (orders.isNotEmpty) {
        return orders.map((e) => OrderEntity.fromMap(e)).toList();
      } else {
        return [];
      }
    } else {
      return [];
    }
  }
}
