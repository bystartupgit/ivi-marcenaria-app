


import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/media_entity.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/mappers/media_mapper.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/mappers/order_dto_mapper.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/mappers/order_mapper.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../core/data/store/core_store.dart';
import '../domain/entities/proposal_entity.dart';

class OrderDataSource {

  final String enviroment = "http://92.112.177.245:5000";
  final String ftp = "92.112.177.245";

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

  Future<List<ProposalEntity>> getWaitingApprovalOrders({required int customerID, required int page, required int limit }) async {

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

      print(response.body);

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<dynamic> proposal = data[OrderMapper.proposal];

        if (proposal.isNotEmpty) {
          return proposal.map((e) => ProposalEntity.fromJson(e)).toList();
        }
        else {
          return [];
        }
      } else {
        return [];
      }
    }catch(e) { return []; }

  }

  Future<MediaEntity?> getMedias({required int orderID}) async {

    Uri url = Uri.parse("$enviroment/api/midia/listar-midias-pedido");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = { "idPedido": orderID, "page": 1, "limit": 10 };

    Response response = await post(
        url, headers: headers, body: jsonEncode(body))
        .timeout(const Duration(seconds: 8));

    if(response.statusCode == 200) {

      Map<String, dynamic> data = jsonDecode(response.body);

      List<dynamic> list = data[MediaMapper.medias];

      if(list.isNotEmpty) { return MediaEntity.fromMap(list.first); }
      else { return null; }


    } else { return null; }
  }

  Future<File?> downloadMedia({required String path, required String name}) async {

    try {
      final client = SSHClient(
        await SSHSocket.connect(ftp, 22),
        username: 'marc-access-app',
        onPasswordRequest: () => 'BySt@rtup@appFront',
      );

      final sftp = await client.sftp();
      final file = await sftp.open(path);
      final Uint8List content = await file.readBytes();

      final tempDir = await getTemporaryDirectory();
      File result = await File('${tempDir.path}/$name').create();

      await result.writeAsBytes(content);

      return result;
    } catch(e) { return null; }

  }


}