




import '../../external/order_datasource.dart';

class DeclineProposalUsecase {

  final OrderDataSource datasource;

  DeclineProposalUsecase({required this.datasource});

  Future<bool> call ({required proposalID, required employeeID }) async =>
      datasource.registerInteresting(proposalID: proposalID, employeeID: employeeID,status: "recusado");
}