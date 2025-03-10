import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../admin/domain/entities/employee_user_entity.dart';
import '../../../../../../admin/domain/entities/order_entity.dart';
import '../../../../../../admin/domain/entities/proposal_entity.dart';
import '../../../../../../admin/domain/usecases/get_order_details_without_employee_usecase.dart';

part 'finish_details_store.g.dart';

class FinishDetailsStore = FinishDetailsStoreBase with _$FinishDetailsStore;

abstract class FinishDetailsStoreBase with Store {

  final _getOrderDetailsWithoutEmployeeUsecase = Modular.get<GetOrderDetailsWithoutEmployeeUsecase>();

  @observable
  OrderEntity? order;

  @observable
  ProposalEntity? proposal;

  @observable
  bool loading = true;

  @action
  setLoading(bool value) => loading = value;

  @action
  init({required int orderID}) async {

    setLoading(true);

    (OrderEntity?, ProposalEntity?, List<EmployeeUserEntity>) result = await _getOrderDetailsWithoutEmployeeUsecase.call(orderID: orderID);

    order = result.$1;
    proposal = result.$2;

    setLoading(false);
  }
}