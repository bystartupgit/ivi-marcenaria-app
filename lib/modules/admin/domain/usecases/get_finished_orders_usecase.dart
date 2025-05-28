import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/admin/external/user_datasource.dart';

class GetFinishedOrdersUsecase {
  final UserDataSource datasource;

  GetFinishedOrdersUsecase({required this.datasource});

  Future<List<OrderEntity>> call(
          {required int customerID,
          required int page,
          required int limit}) async =>
      datasource.getFinishOrders(
          customerID: customerID, page: page, limit: limit);
}
