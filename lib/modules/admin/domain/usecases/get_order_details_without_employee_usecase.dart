import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/admin/domain/entities/proposal_entity.dart';
import 'package:marcenaria/modules/admin/external/order_datasource.dart';

import '../entities/employee_user_entity.dart';

class GetOrderDetailsWithoutEmployeeUsecase {
  final OrderDataSource datasource;

  GetOrderDetailsWithoutEmployeeUsecase({required this.datasource});

  Future<(OrderEntity?, ProposalEntity?, List<EmployeeUserEntity>)> call(
          {required int orderID}) async =>
      datasource.getWaitingChoiceDetailsWithoutEmployees(orderID: orderID);
}
