




import '../../external/service_datasource.dart';

class GetServiceUseCase {

  final ServiceDataSource datasource;

  GetServiceUseCase({required this.datasource});

  Future<void> call({int page = 1, int limit = 10, required int customerID}) async =>
      await datasource.getServices(customerID: customerID, limit: limit, page: page);

}