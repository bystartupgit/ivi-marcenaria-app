import 'package:marcenaria/modules/admin/external/user_datasource.dart';

import '../entities/order_entity.dart';

class GetWaitingOrdersUsecase {
  final UserDataSource datasource;

  GetWaitingOrdersUsecase({required this.datasource});

  Future<List<OrderEntity>> call(
          {required int customerID,
          required int page,
          required int limit}) async =>
      datasource.getWaitingOrders(
          customerID: customerID, page: page, limit: limit);
}
