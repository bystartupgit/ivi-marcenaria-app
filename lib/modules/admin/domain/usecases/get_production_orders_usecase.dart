import 'package:marcenaria/modules/admin/external/user_datasource.dart';

import '../entities/order_entity.dart';

class GetProductionOrdersUsecase {

  final UserDataSource datasource;

  GetProductionOrdersUsecase({required this.datasource});

  Future<List<OrderEntity>> call({required int customerID, required int page, required int limit }) async =>
      datasource.getProductionOrders(customerID: customerID, page: page, limit: limit);

}