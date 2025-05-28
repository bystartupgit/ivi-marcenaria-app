import 'package:marcenaria/modules/admin/domain/entities/customer_quantity_entity.dart';
import 'package:marcenaria/modules/admin/external/user_datasource.dart';

class GetCustomersQuantityOrdersUsecase {
  final UserDataSource datasource;

  GetCustomersQuantityOrdersUsecase({required this.datasource});

  Future<CustomerQuantityEntity> call({required int customerID}) async =>
      datasource.getQuantityCustomerOrders(customerID: customerID);
}
