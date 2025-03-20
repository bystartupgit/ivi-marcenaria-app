

import 'dart:convert';
import 'dart:io';

import 'package:dartssh2/dartssh2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:marcenaria/modules/customer/home/profile/domain/mappers/profile_mappers.dart';

import '../../../../../core/data/store/core_store.dart';
import '../domain/dtos/profile_dto.dart';

class ProfileDatasource {

  final String enviroment = "http://92.112.177.245:5000";
  final String ftp = "92.112.177.245";

  Future<bool> updateProfile({required int userID, required ProfileDTO dto}) async {

    Uri url = Uri.parse("$enviroment/api/usuarios/update/$userID");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = dto.toMap();

    try {

      Response response = await post(
          url, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 8));

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return data[ProfileMappers.message] == ProfileMappers.successMessage;
      }

      else {
        return false;
      }

    } catch(e) { return false; }

  }

  Future<bool> registerMedia({required File photo, required int customerID, required String name}) async {

    final client = SSHClient(
      await SSHSocket.connect(ftp, 22),
      username: 'marc-access-app',
      onPasswordRequest: () => 'BySt@rtup@appFront',
    );

    String path = '/uploads/profile-$customerID-$name';

    SftpClient sftp = await client.sftp();
    final file = await sftp.open(path, mode: SftpFileOpenMode.create | SftpFileOpenMode.write);
    await file.write(photo.openRead().cast());

    Uri url = Uri.parse("$enviroment/api/midia/registrar");

    final String? token = Modular.get<CoreStore>().auth?.token;

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = {
      "nome_arquivo": 'profile-$customerID-$name',
      "tipo": "foto",
      "caminho": path,
      "id_cliente": customerID,
      "in_image_perfil": true,
      "descricao": "Foto de Perfil"
    };

    try {

      Response response = await post(
          url, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 8));

      if(response.statusCode == 201) { Modular.get<CoreStore>().setPathImage(path); return true; }
      else { return false; }

    } catch(e) { return false; }

  }

}