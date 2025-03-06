



import 'package:marcenaria/modules/admin/domain/entities/proposal_entity.dart';

import '../../../../admin/domain/entities/order_entity.dart';
import '../../external/order_datasource.dart';

class GetOrderDetailsUsecase {

  final OrderDataSource datasource;

  GetOrderDetailsUsecase({required this.datasource});

  Future<(OrderEntity?,ProposalEntity?)> call ({required orderID}) async =>
      datasource.getOrderDetails(orderID: orderID);
}