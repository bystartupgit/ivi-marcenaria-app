


import '../../external/order_datasource.dart';

class StartServiceUsecase {

  final OrderDataSource datasource;

  StartServiceUsecase({required this.datasource});

  Future<bool> call ({ required int proposalID }) async =>
      datasource.startService(proposalID: proposalID);
}