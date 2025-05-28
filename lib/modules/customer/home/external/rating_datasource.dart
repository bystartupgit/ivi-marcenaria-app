import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';

import '../../../../core/data/store/core_store.dart';
import '../domain/entities/rating_app_entity.dart';
import '../domain/entities/rating_employee_entity.dart';

class RatingDatasource {
  final String enviroment = "http://92.112.177.245:5000";

  Future<(String, bool)> registerRating(
      {required RatingAPPEntity app,
      required RatingEmployeeEntity employee}) async {
    Uri url = Uri.parse("$enviroment/api/avaliacoes/registrar");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> bodyEmployee = employee.toJson();
    Map<String, dynamic> bodyAPP = app.toJson();

    await post(url, headers: headers, body: jsonEncode(bodyAPP))
        .timeout(const Duration(seconds: 8))
        .then((e) => print(e.body));

    Response response =
        await post(url, headers: headers, body: jsonEncode(bodyEmployee))
            .timeout(const Duration(seconds: 8));

    Map<String, dynamic> data = jsonDecode(response.body);

    String message = data["message"];

    if (response.statusCode == 201) {
      return (message, true);
    } else {
      return (message, false);
    }
  }
}
