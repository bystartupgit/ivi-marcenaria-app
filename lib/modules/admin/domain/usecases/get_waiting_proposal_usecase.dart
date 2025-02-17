



import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/admin/external/order_datasource.dart';

class GetWaitingProposalUsecase {

  final OrderDataSource datasource;

  GetWaitingProposalUsecase({required this.datasource});

  Future<List<OrderEntity>> call ({required int page, required int limit }) async =>
      datasource.getWaitingProposal(page: page, limit: limit);

}