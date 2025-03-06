

import 'package:marcenaria/modules/admin/external/order_datasource.dart';

class GetDeclinedOrderEmployeesUsecase {

  final OrderDataSource datasource;

  GetDeclinedOrderEmployeesUsecase({required this.datasource});

  Future<void> call ({required int page, required int limit }) async =>
      datasource.getDeclinedOrderEmployees(page: page, limit: limit);

}