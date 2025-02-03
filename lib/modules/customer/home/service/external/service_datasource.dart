


import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/mappers/order_dto_mapper.dart';
import 'package:marcenaria/modules/customer/home/service/domain/dto/service_attachment_dto.dart';
import 'package:marcenaria/modules/customer/home/service/domain/dto/service_dto.dart';

import '../../../../../core/data/store/core_store.dart';

class ServiceDataSource {

  final String enviroment = "http://92.112.177.245:5000";

  Future<void> getServices({int page = 1, int limit = 10}) async {

    Uri url = Uri.parse("$enviroment/api/pedidos/listar/aguardando-orcamento");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = { "page": page, "limit": limit };

    try {

      Response response = await post(
          url, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 8));

      dynamic data = response.body;

      print(data);

    } catch(e) { print(e); }

  }

  Future<(String, OrderEntity?)> createService(ServiceDTO service) async {

    Uri url = Uri.parse("$enviroment/api/pedidos/criar");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = service.toMap();

    try {

      Response response = await post(
          url, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 8));

      dynamic data = jsonDecode(response.body);

      String message = data[OrderDTOMapper.message];

      if(response.statusCode == 200) { return (message, OrderEntity.fromMap(data[OrderDTOMapper.order])); }

      else {  return (message, null); }

    } catch(e) { return (e.toString(), null ); }

  }

  Future<(String,bool)> uploadMedia(ServiceAttachmentDTO attachment) async {

    Uri url = Uri.parse("$enviroment/api/midia/registrar");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = attachment.toMap();

    try {

      Response response = await post(url, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 8));

      dynamic data = jsonDecode(response.body);

      String message = data[OrderDTOMapper.message];

      if(response.statusCode == 200) { return (message, true); }

      else {  return (message, false); }

    } catch(e) { return (e.toString(), false); }

  }


}