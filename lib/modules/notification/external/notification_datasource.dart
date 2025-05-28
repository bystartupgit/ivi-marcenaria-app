import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:marcenaria/modules/notification/domain/entities/notification_entity.dart';
import 'package:marcenaria/modules/notification/domain/mappers/notification_mapper.dart';

import '../../../../../core/data/store/core_store.dart';

class NotificationDataSource {
  final String enviroment = "http://92.112.177.245:5000";

  Future<List<NotificationEntity>> getNotifications(
      {required int userID, required int page, required int limit}) async {
    String? token = Modular.get<CoreStore>().auth?.token;

    Uri url = Uri.parse("$enviroment/api/notificacoes/listar-notificacoes");

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {
      "idUsuario": userID,
      "page": page,
      "limit": limit
    };

    Response response =
        await post(url, headers: headers, body: jsonEncode(body))
            .timeout(const Duration(seconds: 8));

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<dynamic> notifications = data[NotificationMapper.notifications];

      if (notifications.isNotEmpty) {
        return notifications.map((e) => NotificationEntity.fromMap(e)).toList();
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  Future<void> readNotification({required int notificationID}) async {
    String? token = Modular.get<CoreStore>().auth?.token;

    Uri url = Uri.parse("$enviroment/api/notificacoes/status");

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {"id_notificacao": notificationID};

    await post(url, headers: headers, body: jsonEncode(body))
        .timeout(const Duration(seconds: 8));
  }
}
