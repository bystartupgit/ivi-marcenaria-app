

import 'package:marcenaria/modules/customer/home/orders/external/order_datasource.dart';

class AproveProposalUsecase {

  final OrderDataSource datasource;

  AproveProposalUsecase({required this.datasource});

  Future<bool> call({required int proposalID, required int customerID }) async =>
      datasource.aproveProposal(proposalID: proposalID,customerID: customerID);

}