

import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/customer/home/orders/external/order_datasource.dart';


class GetWaitingApprovalOrdersUsecase {

  final OrderDataSource datasource;

  GetWaitingApprovalOrdersUsecase({required this.datasource});

  Future<List<OrderEntity>> call({required int customerID, required int page, required int limit }) async =>
      datasource.getWaitingApprovalOrders(customerID: customerID, page: page, limit: limit);

}