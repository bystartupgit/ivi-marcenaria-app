import 'package:marcenaria/modules/admin/external/proposal_datasource.dart';

class SaveEmployeeProposalUseCase {
  final ProposalDataSource datasource;

  SaveEmployeeProposalUseCase({required this.datasource});

  Future<(String, bool)> call(
          {required int proposalID, required int employeeID}) async =>
      datasource.selectionEmployeeToExecution(
          proposalID: proposalID, employeeID: employeeID);
}
