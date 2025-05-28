import 'package:marcenaria/modules/employee/service/external/service_datasource.dart';

import '../../../../admin/domain/entities/order_entity.dart';

class GetServiceFinishUsecase {
  final ServiceDataSource datasource;

  GetServiceFinishUsecase({required this.datasource});

  Future<List<OrderEntity>> call(
          {required int page,
          required int limit,
          required int employeeID}) async =>
      datasource.getServiceFinish(
          page: page, limit: limit, employeeID: employeeID);
}
