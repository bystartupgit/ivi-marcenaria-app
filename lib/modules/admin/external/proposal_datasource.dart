


import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';

import '../../../core/data/store/core_store.dart';
import '../domain/dtos/create_proporsal_dto.dart';

class ProposalDataSource {

  final String enviroment = "http://92.112.177.245:5000";

  Future<void> createProposal({ required CreateProposalDTO dto}) async {

    Uri url = Uri.parse("$enviroment/api/propostas/criar");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = dto.toMap();

    Response response = await post(
        url, headers: headers, body: jsonEncode(body))
        .timeout(const Duration(seconds: 8));

    Map<String, dynamic> data = jsonDecode(response.body);

    print(response.body);
    print(response.statusCode);
  }

}