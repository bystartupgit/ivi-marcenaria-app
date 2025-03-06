


import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';

import '../../../core/data/store/core_store.dart';
import '../domain/dtos/create_proporsal_dto.dart';

class ProposalDataSource {

  final String enviroment = "http://92.112.177.245:5000";
  final String ftp = "92.112.177.245";

  Future<(String,bool)> createProposal({ required CreateProposalDTO dto}) async {
    Uri url = Uri.parse("$enviroment/api/propostas/criar");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = dto.toMap();

    try {

      Response response = await post(
          url, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 8));

      Map<String, dynamic> data = jsonDecode(response.body);

      if(response.statusCode == 201) { return ("Sucesso ao criar proposta", true); }
      else { return ("Não foi possível criar a proposta. Tente novamente mais tarde",false); }

    } catch(e) { return (e.toString(), false); }
  }

  Future<(String,bool)> selectionEmployeeToExecution({required int proposalID, required int employeeID }) async {
    Uri url = Uri.parse("$enviroment/api/propostas/$proposalID/selecionar-execucao");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = { "prestadores": [employeeID] };

    try {

      Response response = await post(
          url, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 8));

      if(response.statusCode == 201) { return ("Sucesso ao selecionar prestador. ", true); }
      else { return ("Não foi possível selecionar o prestador. Tente novamente mais tarde",false); }

    } catch(e) { return (e.toString(), false); }

  }
}
