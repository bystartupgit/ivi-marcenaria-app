import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/admin/external/order_datasource.dart';

class GetWaitingChoiceEmployeesUsecase {
  final OrderDataSource datasource;

  GetWaitingChoiceEmployeesUsecase({required this.datasource});

  Future<List<OrderEntity>> call(
          {required int page, required int limit, String name = ""}) async =>
      datasource.getChoiceOrderEmployees(page: page, limit: limit, name: name);
}
