import 'package:marcenaria/modules/admin/external/order_datasource.dart';

class SavePotentialEmployeeUsecase {
  final OrderDataSource datasource;

  SavePotentialEmployeeUsecase({required this.datasource});

  Future<bool> call(
          {required List<int> employeeIDs, required int proposalID}) async =>
      datasource.savePotentialEmployees(
          employeeIDs: employeeIDs, proposalID: proposalID);
}
