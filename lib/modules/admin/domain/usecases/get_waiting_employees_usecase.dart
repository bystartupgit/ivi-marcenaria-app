


import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/admin/external/order_datasource.dart';

class GetWaitingEmployeesUsecase {

  final OrderDataSource datasource;

  GetWaitingEmployeesUsecase({required this.datasource});

  Future<List<OrderEntity>> call ({required int page, required int limit }) async =>
      datasource.getWaitingOrderEmployees(page: page, limit: limit);

}