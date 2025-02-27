
import 'package:marcenaria/modules/admin/domain/entities/order_without_proposal_entity.dart';
import 'package:marcenaria/modules/admin/external/order_datasource.dart';

class GetOrderWithoutProposalUsecase {

  final OrderDataSource datasource;

  GetOrderWithoutProposalUsecase({required this.datasource});

  Future<OrderWithoutProposalEntity?> call ({required int orderID}) async =>
      datasource.getOrderWithoutProposal(orderID: orderID);

}