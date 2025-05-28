import 'package:marcenaria/modules/admin/external/proposal_datasource.dart';

import '../dtos/create_proporsal_dto.dart';

class CreateProposalUsecase {
  final ProposalDataSource datasource;

  CreateProposalUsecase({required this.datasource});

  Future<(String, bool)> call({required CreateProposalDTO dto}) async =>
      datasource.createProposal(dto: dto);
}
