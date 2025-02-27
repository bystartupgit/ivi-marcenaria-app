


import 'dart:convert';
import 'dart:io';

import 'package:dartssh2/dartssh2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/mappers/order_dto_mapper.dart';
import 'package:marcenaria/modules/customer/home/service/domain/dto/service_attachment_dto.dart';
import 'package:marcenaria/modules/customer/home/service/domain/dto/service_dto.dart';

import '../../../../../core/data/store/core_store.dart';

class ServiceDataSource {

  final String enviroment = "http://92.112.177.245:5000";
  final String ftp = "92.112.177.245";

  Future<void> getServices({int page = 1, int limit = 10, required int customerID}) async {

    Uri url = Uri.parse("$enviroment/api/pedidos/cliente/$customerID/aguardando-orcamento");

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

    Response response = await post(
        url, headers: headers, body: jsonEncode(body))
        .timeout(const Duration(seconds: 8));

      dynamic data = jsonDecode(response.body);

      String message = data[OrderDTOMapper.message];

      if(response.statusCode == 201) { return (message, OrderEntity.fromMap(data[OrderDTOMapper.order])); }

      else { return (message, null); }

  }

  Future<(String,bool)> uploadMedia(ServiceAttachmentDTO attachment, File media) async {

    final client = SSHClient(
      await SSHSocket.connect(ftp, 22),
      username: 'marc-access-app',
      onPasswordRequest: () => 'BySt@rtup@appFront',
    );

    String path = '/uploads/${attachment.orderID}-${attachment.name}';

    SftpClient sftp = await client.sftp();
    final file = await sftp.open(path, mode: SftpFileOpenMode.create | SftpFileOpenMode.write);
    await file.write(media.openRead().cast());

    Uri url = Uri.parse("$enviroment/api/midia/registrar");

      String? token = Modular.get<CoreStore>().auth?.token;

      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };

      Map<String, dynamic> body = attachment.copyWith(path).toMap();

      try {
        Response response = await post(
            url, headers: headers, body: jsonEncode(body))
            .timeout(const Duration(seconds: 8));

        dynamic data = jsonDecode(response.body);

        String message = data[OrderDTOMapper.message];

        if (response.statusCode == 200) {
          return (message, true);
        }

        else {
          return (message, false);
        }
      } catch (e) {
        return (e.toString(), false);
      }
  }


}