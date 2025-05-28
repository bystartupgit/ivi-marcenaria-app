import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/customer/home/service/domain/dto/service_dto.dart';
import 'package:marcenaria/modules/customer/home/service/external/service_datasource.dart';

class CreateServiceUseCase {
  final ServiceDataSource datasource;

  CreateServiceUseCase({required this.datasource});

  Future<(String, OrderEntity?)> call(ServiceDTO service) async =>
      await datasource.createService(service);
}
