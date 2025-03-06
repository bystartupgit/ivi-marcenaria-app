


import 'package:marcenaria/modules/admin/domain/entities/employee_user_entity.dart';
import 'package:marcenaria/modules/admin/external/order_datasource.dart';

class GetEmployeeSelectionForJobUsecase {

  final OrderDataSource datasource;

  GetEmployeeSelectionForJobUsecase({required this.datasource});

  Future<List<EmployeeUserEntity>> call ({required int page, required int limit, required int proposalID }) async =>
      datasource.getEmployeeSelectionForJob(page: page, limit: limit, proposalID: proposalID);

}