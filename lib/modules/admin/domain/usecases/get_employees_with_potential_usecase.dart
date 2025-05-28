import 'package:marcenaria/modules/admin/external/order_datasource.dart';

import '../entities/employee_user_entity.dart';

class GetEmployeesWithPotentialUseCase {
  final OrderDataSource datasource;

  GetEmployeesWithPotentialUseCase({required this.datasource});

  Future<List<EmployeeUserEntity>> call(
          {required int page,
          required int limit,
          required int proposalID}) async =>
      datasource.getWaitingEmployeesWithPotential(
          page: page, limit: limit, proposalID: proposalID);
}
