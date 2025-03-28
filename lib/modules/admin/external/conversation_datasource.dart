

import 'dart:convert';
import 'dart:core';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:marcenaria/modules/admin/domain/entities/conversation_order_entity.dart';

import '../../../core/data/store/core_store.dart';

class ConversationDataSource {

  final String enviroment = "http://92.112.177.245:5000";

  Future<List<ConversationOrderEntity>> getOrderConversations({ required int page, required int limit, String title = "" }) async {

    Uri url = Uri.parse("$enviroment/api/mensagens/lista-pedidos-com-mensagem");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = { "page" : page, "limit" : limit, "Titulo": title }
      ..removeWhere((key,value) => value is String && value.isEmpty);

    Response response = await post(
        url, headers: headers, body: jsonEncode(body))
        .timeout(const Duration(seconds: 5));

    print(response.body);

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {

      List<dynamic> orders = data["pedidos"];

      if(orders.isNotEmpty) {

        List<ConversationOrderEntity> conversations = orders.map((e) => ConversationOrderEntity.fromMap(e)).toList();

        return conversations;
      } else { return []; }
    }
    else { return []; }
  }

  Future<void> getprivateConversations({ required int page, required int limit, String title = "" }) async {

    Uri url = Uri.parse("$enviroment/api/mensagens/lista-usuarios-com-mensagem-suporte");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = { "page" : page, "limit" : limit, "Titulo": title }
      ..removeWhere((key,value) => value is String && value.isEmpty);

    Response response = await post(
        url, headers: headers, body: jsonEncode(body))
        .timeout(const Duration(seconds: 8));

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {

      List<dynamic> orders = data["pedidos"];

    } else {}

  }

}