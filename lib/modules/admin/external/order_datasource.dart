import 'dart:convert';
import 'dart:developer';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart';
import 'package:marcenaria/modules/admin/domain/dtos/create_order_dto.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_without_proposal_entity.dart';
import 'package:marcenaria/modules/admin/domain/entities/proposal_entity.dart';
import 'package:marcenaria/modules/admin/domain/mappers/order_mapper.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/mappers/order_dto_mapper.dart';

import '../../../../core/data/store/core_store.dart';
import '../domain/entities/employee_user_entity.dart';
import '../domain/mappers/employee_user_mapper.dart';

class OrderDataSource {
  final String enviroment = "http://92.112.177.245:5000";

  Future<List<OrderEntity>> getWaitingProposal(
      {required int page, required int limit}) async {
    Uri url = Uri.parse("$enviroment/api/pedidos/listar/aguardando-orcamento");

    String? token = Modular.get<CoreStore>().auth?.token;

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
      List<dynamic> orders = data[OrderMapper.orders];

      if (orders.isNotEmpty) {
        return orders.map((e) => OrderEntity.fromMap(e)).toList();
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  Future<OrderWithoutProposalEntity?> getOrderWithoutProposal(
      {required int orderID}) async {
    Uri url = Uri.parse("$enviroment/api/pedidos/unico");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {"id": orderID};

    Response response =
        await post(url, headers: headers, body: jsonEncode(body))
            .timeout(const Duration(seconds: 8));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return OrderWithoutProposalEntity.fromMap(data[OrderMapper.order]);
    } else {
      return null;
    }
  }

  Future<List<OrderEntity>> getWaitingApproval(
      {required int page, required int limit}) async {
    Uri url = Uri.parse("$enviroment/api/pedidos/listar/aceitos");

    String? token = Modular.get<CoreStore>().auth?.token;

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
      List<dynamic> orders = data[OrderMapper.orders];

      if (orders.isNotEmpty) {
        return orders.map((e) => OrderEntity.fromMap(e)).toList();
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  Future<(OrderEntity?, ProposalEntity?, List<EmployeeUserEntity>)>
      getWaitingChoiceDetailsWithoutEmployees({required int orderID}) async {
    Uri url = Uri.parse("$enviroment/api/pedidos/unico");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {"id": orderID};

    Response response =
        await post(url, headers: headers, body: jsonEncode(body))
            .timeout(const Duration(seconds: 8));

    log(response.body.toString());

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      List<dynamic> list = data["prestadores"] ?? [];

      final OrderEntity order = OrderEntity.fromMap(data[OrderMapper.order]);
      final ProposalEntity proposal =
          ProposalEntity.fromJson(data[OrderMapper.proposal]);
      final List<EmployeeUserEntity> employees =
          list.map((e) => EmployeeUserEntity.fromOrder(e)).toList();

      return (order, proposal, employees);
    } else {
      return (null, null, <EmployeeUserEntity>[]);
    }
  }

  Future<List<OrderEntity>> getWaitingOrderEmployees(
      {required int page, required int limit}) async {
    Uri url =
        Uri.parse("$enviroment/api/pedidos/pedidos-aguardando-prestadores");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {
      "page": page,
      "limit": limit,
      "Titulo": "",
    };

    try {
      Response response =
          await post(url, headers: headers, body: jsonEncode(body))
              .timeout(const Duration(seconds: 8));

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<dynamic> orders = data[OrderMapper.orders];

        if (orders.isEmpty) {
          return [];
        } else {
          return orders.map((e) => OrderEntity.fromMap(e)).toList();
        }
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<EmployeeUserEntity>> getWaitingEmployeesWithPotential(
      {required int page, required int limit, required proposalID}) async {
    Uri url = Uri.parse(
        "$enviroment/api/pedidos/prestadores-nao-selecionados-interesse");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {
      "page": page,
      "limit": limit,
      "id_proposta": proposalID
    };

    Response response =
        await post(url, headers: headers, body: jsonEncode(body))
            .timeout(const Duration(seconds: 8));

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<dynamic> result = data[EmployeeUserMapper.employees];

      if (result.isNotEmpty) {
        return result.map((e) => EmployeeUserEntity.fromMap(e)).toList();
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  Future<List<EmployeeUserEntity>> getEmployeeSelectionForJob(
      {required int page, required int limit, required proposalID}) async {
    Uri url = Uri.parse(
        "$enviroment/api/pedidos/prestadores-selecionados-interesse-selecao");
    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {
      "page": page,
      "limit": limit,
      "id_proposta": proposalID
    };

    Response response =
        await post(url, headers: headers, body: jsonEncode(body))
            .timeout(const Duration(seconds: 8));

    Map<String, dynamic> data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<dynamic> result = data[EmployeeUserMapper.employees];

      if (result.isNotEmpty) {
        return result
            .map((e) => EmployeeUserEntity.fromMapWithInteresting(
                e[EmployeeUserMapper.employee], e["status_interesse"]))
            .toList();
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  Future<bool> savePotentialEmployees(
      {required List<int> employeeIDs, required int proposalID}) async {
    Uri url =
        Uri.parse("$enviroment/api/propostas/$proposalID/selecionar-potencial");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {"prestadores": employeeIDs};

    try {
      Response response =
          await post(url, headers: headers, body: jsonEncode(body))
              .timeout(const Duration(seconds: 8));

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List<OrderEntity>> getChoiceOrderEmployees(
      {required int page, required int limit, String name = ""}) async {
    Uri url = Uri.parse(
        "$enviroment/api/pedidos/pedidos-com-prestadores-selecionados");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = {"page": page, "limit": limit, "Titulo": name};

    try {
      Response response =
          await post(url, headers: headers, body: jsonEncode(body))
              .timeout(const Duration(seconds: 8));

      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        List<dynamic> orders = data[OrderMapper.orders];

        if (orders.isEmpty) {
          return [];
        } else {
          return orders.map((e) => OrderEntity.fromMap(e)).toList();
        }
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<OrderEntity>> getProductionOrders(
      {required int page, required int limit}) async {
    Uri url = Uri.parse("$enviroment/api/pedidos/listar/em-execucao");

    String? token = Modular.get<CoreStore>().auth?.token;

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
      List<dynamic> orders = data[OrderMapper.orders];

      if (orders.isNotEmpty) {
        return orders.map((e) => OrderEntity.fromMap(e)).toList();
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  Future<List<OrderEntity>> getConclusionOrders(
      {required int page, required int limit}) async {
    Uri url = Uri.parse("$enviroment/api/pedidos/listar/concluidos");

    String? token = Modular.get<CoreStore>().auth?.token;

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
      List<dynamic> orders = data[OrderMapper.orders];

      if (orders.isNotEmpty) {
        return orders.map((e) => OrderEntity.fromMap(e)).toList();
      } else {
        return [];
      }
    } else {
      return [];
    }
  }

  Future<(String, OrderEntity?)> createOrder(
      {required CreateOrderDTO dto}) async {
    Uri url = Uri.parse("$enviroment/api/pedidos/criar");

    String? token = Modular.get<CoreStore>().auth?.token;

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };

    Map<String, dynamic> body = dto.toMap();

    try {
      print("🔵 [CREATE_ORDER] Criando pedido: ${jsonEncode(body)}");
      log("Criando pedido: ${jsonEncode(body)}");
      
      Response response =
          await post(url, headers: headers, body: jsonEncode(body))
              .timeout(const Duration(seconds: 8));

      print("🟢 [CREATE_ORDER] Resposta do servidor - Status: ${response.statusCode}");
      print("🟢 [CREATE_ORDER] Resposta do servidor - Body: ${response.body}");
      log("Resposta do servidor - Status: ${response.statusCode}");
      log("Resposta do servidor - Body: ${response.body}");

      dynamic data = jsonDecode(response.body);

      String message = data[OrderDTOMapper.message] ?? "Erro desconhecido";

      if (response.statusCode == 201) {
        print("🟢 [CREATE_ORDER] Status 201 - Verificando campo 'pedido'");
        print("🟢 [CREATE_ORDER] Dados completos da resposta: ${jsonEncode(data)}");
        print("🟢 [CREATE_ORDER] Campo 'pedido' existe? ${data[OrderDTOMapper.order] != null}");
        
        if (data[OrderDTOMapper.order] != null) {
          try {
            print("🟢 [CREATE_ORDER] Dados do pedido recebido: ${jsonEncode(data[OrderDTOMapper.order])}");
            OrderEntity order = OrderEntity.fromMap(data[OrderDTOMapper.order]);
            print("✅ [CREATE_ORDER] Pedido criado com sucesso: ${order.id}");
            print("✅ [CREATE_ORDER] Detalhes do pedido: id=${order.id}, titulo=${order.title}, status=${order.status}");
            log("Pedido criado com sucesso: ${order.id}");
            return (message, order);
          } catch (e, stackTrace) {
            print("❌ [CREATE_ORDER] Erro ao parsear pedido: $e");
            print("❌ [CREATE_ORDER] Stack trace: $stackTrace");
            log("Erro ao parsear pedido: $e");
            return ("Erro ao processar resposta do servidor: $e", null);
          }
        } else {
          print("❌ [CREATE_ORDER] Resposta não contém campo 'pedido'");
          print("❌ [CREATE_ORDER] Chaves disponíveis na resposta: ${data.keys.toList()}");
          log("Resposta não contém campo 'pedido'");
          return ("Resposta do servidor inválida: campo 'pedido' não encontrado", null);
        }
      } else {
        print("❌ [CREATE_ORDER] Erro na criação do pedido: $message");
        print("❌ [CREATE_ORDER] Status code: ${response.statusCode}");
        log("Erro na criação do pedido: $message");
        return (message, null);
      }
    } catch (e) {
      print("❌ [CREATE_ORDER] Exceção ao criar pedido: $e");
      log("Exceção ao criar pedido: $e");
      return ("Erro ao criar pedido: ${e.toString()}", null);
    }
  }
}
