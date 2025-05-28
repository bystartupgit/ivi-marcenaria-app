import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/modules/admin/domain/entities/admin_entity.dart';
import 'package:marcenaria/modules/admin/domain/entities/customer_user_entity.dart';
import 'package:marcenaria/modules/admin/domain/entities/employee_user_entity.dart';
import 'package:marcenaria/modules/admin/domain/mappers/customer_quantity_mapper.dart';
import 'package:marcenaria/modules/login/domain/enums/user_type_enum.dart';

import '../domain/entities/customer_quantity_entity.dart';
import '../domain/entities/order_entity.dart';

class UserDataSource {
  final String enviroment = "http://92.112.177.245:5000";

  Future<AdminEntity?> getUserDetails(
      {required int id, required UserType type}) async {
    Uri url = Uri.parse("$enviroment/api/usuarios/detalhes");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {"id": id, "tipo": "administrador"};

    Response response =
        await post(url, headers: headers, body: jsonEncode(body))
            .timeout(const Duration(seconds: 8));

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return AdminEntity.fromMap(data);
    } else {
      return null;
    }
  }

  Future<List<CustomerUserEntity>> getCustomers(
      {required int page, required int limit, String name = ""}) async {
    Uri url = Uri.parse("$enviroment/api/clientes/");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {"page": page, "limit": limit, "nome": name}
      ..removeWhere((key, value) => value is String && value.isEmpty);

    Response response =
        await post(url, headers: headers, body: jsonEncode(body))
            .timeout(const Duration(seconds: 8));

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<dynamic> result = data["clientes"];

      if (result.isNotEmpty) {
        return result.map((e) => CustomerUserEntity.fromMap(e)).toList();
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  Future<List<EmployeeUserEntity>> getEmployees(
      {required int page, required int limit, String name = ""}) async {
    Uri url = Uri.parse("$enviroment/api/clientes/");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {"page": page, "limit": limit, "nome": name}
      ..removeWhere((key, value) => value is String && value.isEmpty);

    Response response =
        await post(url, headers: headers, body: jsonEncode(body))
            .timeout(const Duration(seconds: 8));

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<dynamic> result = data["clientes"];

      if (result.isNotEmpty) {
        return result.map((e) => EmployeeUserEntity.fromMap(e)).toList();
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  Future<CustomerQuantityEntity> getQuantityCustomerOrders(
      {required int customerID}) async {
    Uri url = Uri.parse("$enviroment/api/pedidos/quantitativos");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {"id_cliente": customerID};

    Response response =
        await post(url, headers: headers, body: jsonEncode(body))
            .timeout(const Duration(seconds: 8));

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final dynamic result = data[CustomerQuantityMapper.orders];

      return CustomerQuantityEntity.fromMap(result);
    } else {
      return CustomerQuantityEntity();
    }
  }

  Future<List<OrderEntity>> getWaitingOrders(
      {required int customerID, required int page, required int limit}) async {
    String? token = Modular.get<CoreStore>().auth?.token;

    Uri url = Uri.parse(
        "$enviroment/api/pedidos/cliente/$customerID/aguardando-orcamento");

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
        List<dynamic> list = data["pedidos"];

        return list.map((e) => OrderEntity.fromMap(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<OrderEntity>> getWaitingApprovalOrders(
      {required int customerID, required int page, required int limit}) async {
    String? token = Modular.get<CoreStore>().auth?.token;

    Uri url = Uri.parse(
        "$enviroment/api/pedidos/cliente/$customerID/aguardando-aprovacao");

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
        return [];
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<OrderEntity>> getProductionOrders(
      {required int customerID, required int page, required int limit}) async {
    String? token = Modular.get<CoreStore>().auth?.token;

    Uri url =
        Uri.parse("$enviroment/api/pedidos/cliente/$customerID/em-producao");

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {"page": page, "limit": limit};

    Response response =
        await post(url, headers: headers, body: jsonEncode(body))
            .timeout(const Duration(seconds: 8));

    Map<String, dynamic> data = jsonDecode(response.body);

    print("production");
    print(data.toString());

    if (response.statusCode == 200) {
      return [];
    } else {
      return [];
    }
  }

  Future<List<OrderEntity>> getFinishOrders(
      {required int customerID, required int page, required int limit}) async {
    String? token = Modular.get<CoreStore>().auth?.token;

    Uri url =
        Uri.parse("$enviroment/api/pedidos/cliente/$customerID/concluidos");

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {"page": page, "limit": limit};

    Response response =
        await post(url, headers: headers, body: jsonEncode(body))
            .timeout(const Duration(seconds: 8));

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<dynamic> list = data["pedidos"];

      return list.map((e) => OrderEntity.fromMap(e)).toList();
    } else {
      return [];
    }
  }

  Future<bool> registerFirebaseToken(
      {required String fcmToken, required int userID}) async {
    Uri url = Uri.parse("$enviroment/api/usuarios/validateToken");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {"id_usuario": userID, "token": fcmToken};

    try {
      Response response =
          await post(url, headers: headers, body: jsonEncode(body))
              .timeout(const Duration(seconds: 8));

      dynamic data = jsonDecode(response.body);

      print(data.toString());

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
