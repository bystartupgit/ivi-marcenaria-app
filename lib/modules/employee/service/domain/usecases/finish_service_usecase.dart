


import 'package:marcenaria/modules/employee/service/external/service_datasource.dart';

class FinishServiceUsecase {

  final ServiceDataSource datasource;

  FinishServiceUsecase({required this.datasource});

  Future<(String,bool)> call ({required int proposalID }) async =>
      datasource.finishService(proposalID: proposalID);
}