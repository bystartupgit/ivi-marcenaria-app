import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/admin/external/order_datasource.dart';

class GetOrderWaitingAppovalUsecase {

  final OrderDataSource datasource;

  GetOrderWaitingAppovalUsecase({required this.datasource});

  Future<List<OrderEntity>> call ({ required int page, required int limit }) async =>
      datasource.getWaitingApproval(page: page, limit: limit);

}