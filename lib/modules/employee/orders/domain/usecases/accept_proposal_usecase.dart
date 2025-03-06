




import '../../external/order_datasource.dart';

class AcceptProposalUsecase {

  final OrderDataSource datasource;

  AcceptProposalUsecase({required this.datasource});

  Future<bool> call ({required proposalID, required employeeID }) async =>
      datasource.registerInteresting(proposalID: proposalID, employeeID: employeeID,status: "interessado");
}