import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';

import '../../external/proposal_datasource.dart';

class GetProductionOrdersUsecase {
  final ProposalDataSource datasource;

  GetProductionOrdersUsecase({required this.datasource});

  Future<List<OrderEntity>> call(
          {required int customerID,
          required int page,
          required int limit}) async =>
      datasource.getProductionOrders(
          customerID: customerID, page: page, limit: limit);
}
