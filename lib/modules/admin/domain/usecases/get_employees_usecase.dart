


import 'package:marcenaria/modules/admin/external/role_datasource.dart';

import '../entities/employee_user_entity.dart';

class GetEmployeesUsecase {

  final RoleDataSource datasource;

  GetEmployeesUsecase({required this.datasource});

  Future<List<EmployeeUserEntity>> call ({required int page, required int limit, String name = ""}) async =>
      datasource.getEmployees(page: page, limit: limit,name: name);

}