import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/admin/external/user_datasource.dart';

class GetWaitingApprovalOrdersUsecase {
  final UserDataSource datasource;

  GetWaitingApprovalOrdersUsecase({required this.datasource});

  Future<List<OrderEntity>> call(
          {required int customerID,
          required int page,
          required int limit}) async =>
      datasource.getWaitingApprovalOrders(
          customerID: customerID, page: page, limit: limit);
}
