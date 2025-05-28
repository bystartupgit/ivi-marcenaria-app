import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';

import '../../external/proposal_datasource.dart';

class GetFinishedOrdersUsecase {
  final ProposalDataSource datasource;

  GetFinishedOrdersUsecase({required this.datasource});

  Future<List<OrderEntity>> call(
          {required int customerID,
          required int page,
          required int limit}) async =>
      datasource.getFinishOrders(
          customerID: customerID, page: page, limit: limit);
}
