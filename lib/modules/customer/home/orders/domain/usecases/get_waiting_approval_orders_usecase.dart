import 'package:marcenaria/modules/customer/home/orders/external/order_datasource.dart';

import '../entities/proposal_entity.dart';

class GetWaitingApprovalOrdersUsecase {
  final OrderDataSource datasource;

  GetWaitingApprovalOrdersUsecase({required this.datasource});

  Future<List<ProposalEntity>> call(
          {required int customerID,
          required int page,
          required int limit}) async =>
      datasource.getWaitingApprovalOrders(
          customerID: customerID, page: page, limit: limit);
}
