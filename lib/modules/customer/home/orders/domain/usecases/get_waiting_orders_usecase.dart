import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/customer/home/orders/external/order_datasource.dart';

class GetWaitingOrdersUsecase {
  final OrderDataSource datasource;

  GetWaitingOrdersUsecase({required this.datasource});

  Future<List<OrderEntity>> call(
          {required int customerID,
          required int page,
          required int limit}) async =>
      datasource.getWaitingOrders(
          customerID: customerID, page: page, limit: limit);
}
