



import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/employee/orders/external/order_datasource.dart';

class GetWaitingInterestOrdersUsecase {

  final OrderDataSource datasource;

  GetWaitingInterestOrdersUsecase({required this.datasource});

  Future<List<OrderEntity>> call ({required employeeID, required int page, required int limit }) async =>
      datasource.getWaitingInterestOrders(employeeID: employeeID, page: page, limit: limit);
}