import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/domain/entities/employee_user_entity.dart';
import 'package:marcenaria/modules/admin/domain/entities/proposal_entity.dart';
import 'package:mobx/mobx.dart';

import '../../../../domain/entities/order_entity.dart';
import '../../../../domain/usecases/get_order_details_without_employee_usecase.dart';

part 'conclusion_details_store.g.dart';

class ConclusionDetailsStore = ConclusionDetailsStoreBase with _$ConclusionDetailsStore;

abstract class ConclusionDetailsStoreBase with Store {

  final _getOrderDetailsWithoutEmployeeUsecase = Modular.get<GetOrderDetailsWithoutEmployeeUsecase>();

  @observable
  OrderEntity? order;

  @observable
  ProposalEntity? proposal;

  @observable
  List<EmployeeUserEntity> employees = <EmployeeUserEntity>[].asObservable();

  @observable
  bool loading = true;

  @action
  setLoading(bool value) => loading = value;

  @action
  init({required int orderID}) async {

    setLoading(true);

    (OrderEntity?, ProposalEntity?,List<EmployeeUserEntity>) result = await _getOrderDetailsWithoutEmployeeUsecase.call(orderID: orderID);

    order = result.$1;
    proposal = result.$2;
    employees = result.$3;

    setLoading(false);
  }
}