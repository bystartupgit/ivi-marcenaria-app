



import 'package:marcenaria/modules/admin/external/order_datasource.dart';

import '../entities/order_entity.dart';

class GetAllProductionOrdersUsecase {

  final OrderDataSource datasource;

  GetAllProductionOrdersUsecase({required this.datasource});

  Future<List<OrderEntity>> call ({required int page, required int limit }) async =>
      datasource.getProductionOrders(page: page, limit: limit);

}