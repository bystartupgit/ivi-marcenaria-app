


import 'dart:convert';
import 'dart:io';

import 'package:dartssh2/dartssh2.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/modules/employee/domain/entities/employee_entity.dart';
import 'package:marcenaria/modules/login/domain/enums/user_type_enum.dart';

import '../../customer/home/profile/domain/mappers/profile_mappers.dart';
import '../domain/dto/profile_dto.dart';

class UserDataSource {

  final String enviroment = "http://92.112.177.245:5000";
  final String ftp = "92.112.177.245";

  Future<EmployeeEntity?> getUserDetails({required int id, required UserType type}) async {

    Uri url = Uri.parse("$enviroment/api/usuarios/detalhes");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String,String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String,dynamic> body = { "id": id, "tipo": type.name };

      Response response = await post(
          url, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 8));

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return EmployeeEntity.fromMap(data);
      }

      else { return null; }



  }

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

  Future<bool> registerMedia({required File photo, required int employeeID, required String name}) async {

    final client = SSHClient(
      await SSHSocket.connect(ftp, 22),
      username: 'marc-access-app',
      onPasswordRequest: () => 'BySt@rtup@appFront',
    );

    String path = '/uploads/profile-$employeeID-$name';

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
      "nome_arquivo": 'profile-$employeeID-$name',
      "tipo": "foto",
      "caminho": path,
      "id_prestador": employeeID,
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

  Future<bool> registerDocumentMedia({required File photo, required int employeeID, required String name, required String description}) async {

    final client = SSHClient(
      await SSHSocket.connect(ftp, 22),
      username: 'marc-access-app',
      onPasswordRequest: () => 'BySt@rtup@appFront',
    );

    String path = '/uploads/profile-$employeeID-$name';

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
      "nome_arquivo": 'profile-$employeeID-$name',
      "tipo": "foto",
      "caminho": path,
      "id_prestador": employeeID,
      "in_doc_prestador": true,
      "descricao": description
    };

    try {

      Response response = await post(
          url, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 8));

      if(response.statusCode == 201) { return true; }
      else { return false; }

    } catch(e) { return false; }

  }

  Future<bool> registerFirebaseToken({required String fcmToken, required int userID}) async {

    Uri url = Uri.parse("$enviroment/api/usuarios/validateToken");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String,String> headers = {"Content-Type": "application/json", "Authorization": "Bearer $token"};

    Map<String,dynamic> body = {
      "id_usuario": userID,
      "token": fcmToken
    };

    try {

      Response response = await post(
          url, headers: headers, body: jsonEncode(body))
          .timeout(const Duration(seconds: 8));

      if(response.statusCode == 200) { return true; } else { return false; }

    } catch(e) { return false; }

  }

}