import 'package:marcenaria/modules/admin/domain/dtos/create_order_dto.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/admin/external/order_datasource.dart';

class CreateOrderUsecase {
  final OrderDataSource datasource;

  CreateOrderUsecase({required this.datasource});

  Future<(String, OrderEntity?)> call({required CreateOrderDTO dto}) async =>
      datasource.createOrder(dto: dto);
}

