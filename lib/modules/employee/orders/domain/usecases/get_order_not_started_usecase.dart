


import '../../../../admin/domain/entities/order_entity.dart';
import '../../external/order_datasource.dart';

class GetOrderNotStartedUsecase {

  final OrderDataSource datasource;

  GetOrderNotStartedUsecase({required this.datasource});

  Future<List<OrderEntity>> call ({required employeeID, required int page, required int limit }) async =>
      datasource.getOrderNotStarted(employeeID: employeeID, page: page, limit: limit);
}