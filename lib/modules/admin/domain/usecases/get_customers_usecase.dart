import 'package:marcenaria/modules/admin/external/user_datasource.dart';

import '../entities/customer_user_entity.dart';

class GetCustomersUsecase {
  final UserDataSource datasource;

  GetCustomersUsecase({required this.datasource});

  Future<List<CustomerUserEntity>> call(
          {required int page, required int limit, String name = ""}) async =>
      datasource.getCustomers(page: page, limit: limit, name: name);
}
