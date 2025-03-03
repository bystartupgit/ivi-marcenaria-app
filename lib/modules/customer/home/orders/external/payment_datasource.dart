

import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';

import '../../../../../core/data/store/core_store.dart';

class PaymentDataSource {

  final String enviroment = "http://92.112.177.245:5000";

  Future<bool> confirmPayment({required int proposalID}) async {

    String? token = Modular.get<CoreStore>().auth?.token;

    Uri url = Uri.parse("$enviroment/api/propostas/$proposalID/pagamento");

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

      print(data.toString());

      if (response.statusCode == 200) {
        return data["message"] == "Pagamento registrado com sucesso.";

      } else { return throw Exception(data["message"]); }

    } catch(e) { return false; }


  }
}