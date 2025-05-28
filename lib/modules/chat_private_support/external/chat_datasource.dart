import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:marcenaria/modules/chat_support/domain/dto/message_support_dto.dart';

import '../../../../core/data/store/core_store.dart';
import '../domain/entities/message_entity.dart';
import '../domain/mappers/message_mapper.dart';

class ChatDataSource {
  final String enviroment = "http://92.112.177.245:5000";

  Future<List<MessageEntity>> getMessagesSupport(
      {required int supportID, required int page, required int limit}) async {
    String? token = Modular.get<CoreStore>().auth?.token;

    Uri url = Uri.parse("$enviroment/api/mensagens/suporte/$supportID/listar");

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {"page": page, "limit": limit};

    try {
      Response response =
          await post(url, headers: headers, body: jsonEncode(body))
              .timeout(const Duration(seconds: 8));

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<dynamic> messages = data[MessageMapper.messages];

        if (messages.isNotEmpty) {
          return messages.map((e) => MessageEntity.fromMap(e)).toList();
        } else {
          return [];
        }
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<void> sendMessageSupport({required MessageSupportDTO dto}) async {
    String? token = Modular.get<CoreStore>().auth?.token;

    Uri url = Uri.parse("$enviroment/api/mensagens/suporte");

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = dto.toMap();

    try {
      Response response =
          await post(url, headers: headers, body: jsonEncode(body));

      print(response.body);
    } catch (e) {}
  }
}
