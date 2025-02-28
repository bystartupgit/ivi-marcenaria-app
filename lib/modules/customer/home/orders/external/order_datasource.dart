


import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/mappers/order_dto_mapper.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/mappers/order_mapper.dart';

import '../../../../../core/data/store/core_store.dart';

class OrderDataSource {

  final String enviroment = "http://92.112.177.245:5000";

  Future<bool> cancelOrder({required int orderID}) async {

    String? token = Modular.get<CoreStore>().auth?.token;

    Uri url = Uri.parse("$enviroment/api/pedidos/cancelar/$orderID");

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = {};

    try {

      Response response = await post(
          url, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 8));

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data[OrderDTOMapper.message] == OrderDTOMapper.messageSuccess;

      } else { return false; }

    } catch(e) { return false; }


  }

  Future<List<OrderEntity>> getWaitingOrders({required int customerID, required int page, required int limit }) async {

    String? token = Modular.get<CoreStore>().auth?.token;

    Uri url = Uri.parse("$enviroment/api/pedidos/cliente/$customerID/aguardando-orcamento");

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = { "page" : page, "limit" : limit };

    try {
      Response response = await post(
          url, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 8));

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<dynamic> orders = data[OrderMapper.orders];

        if (orders.isNotEmpty) {
          return orders.map((e) => OrderEntity.fromMap(e)).toList();
        }
        else {
          return [];
        }
      } else {
        return [];
      }
    } catch(e) { return []; }

  }

  Future<List<OrderEntity>> getWaitingApprovalOrders({required int customerID, required int page, required int limit }) async {

    String? token = Modular.get<CoreStore>().auth?.token;

    Uri url = Uri.parse("$enviroment/api/pedidos/cliente/$customerID/aguardando-aprovacao");

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = { "page" : page, "limit" : limit };



    try {
      Response response = await post(
          url, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 8));

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<dynamic> orders = data[OrderMapper.orders];

        if (orders.isNotEmpty) {
          return orders.map((e) => OrderEntity.fromMap(e)).toList();
        }
        else {
          return [];
        }
      } else {
        return [];
      }
    }catch(e) { return []; }

  }

}