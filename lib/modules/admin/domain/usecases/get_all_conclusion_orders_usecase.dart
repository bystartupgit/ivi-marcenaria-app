import 'package:marcenaria/modules/admin/external/order_datasource.dart';

import '../entities/order_entity.dart';

class GetAllConclusionOrdersUsecase {

  final OrderDataSource datasource;

  GetAllConclusionOrdersUsecase({required this.datasource});

  Future<List<OrderEntity>> call ({required int page, required int limit }) async =>
      datasource.getConclusionOrders(page: page, limit: limit);

}