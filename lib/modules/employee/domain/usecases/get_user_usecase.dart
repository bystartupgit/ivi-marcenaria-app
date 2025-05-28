import 'package:marcenaria/modules/employee/domain/entities/employee_entity.dart';
import 'package:marcenaria/modules/login/domain/enums/user_type_enum.dart';

import '../../external/user_datasource.dart';

class GetUserUseCase {
  final UserDataSource datasource;

  GetUserUseCase({required this.datasource});

  Future<EmployeeEntity?> call(
          {required int id, required UserType type}) async =>
      datasource.getUserDetails(id: id, type: type);
}
