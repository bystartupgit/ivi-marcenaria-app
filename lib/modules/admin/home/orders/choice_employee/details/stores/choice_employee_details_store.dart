import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/domain/entities/employee_user_entity.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/admin/domain/entities/proposal_entity.dart';
import 'package:mobx/mobx.dart';

import '../../../../../domain/usecases/get_employee_selection_for_job_usecase.dart';
import '../../../../../domain/usecases/get_order_details_without_employee_usecase.dart';

part 'choice_employee_details_store.g.dart';

class ChoiceEmployeeDetailsStore = ChoiceEmployeeDetailsStoreBase with _$ChoiceEmployeeDetailsStore;

abstract class ChoiceEmployeeDetailsStoreBase with Store {

  final _getOrderDetailsWithoutEmployeeUsecase = Modular.get<GetOrderDetailsWithoutEmployeeUsecase>();
  final _getEmployeeSelectionForJobUsecase = Modular.get<GetEmployeeSelectionForJobUsecase>();

  final ScrollController scroll = ScrollController();

  @observable
  int page = 1;

  @observable
  int limit = 10;

  @observable
  ObservableList<EmployeeUserEntity> employees = <EmployeeUserEntity>[].asObservable();

  @observable
  OrderEntity? order;

  @observable
  ProposalEntity? proposal;

  @observable
  bool loading = true;

  @action
  addPagination() => page++;

  @action
  setLoading(bool value) => loading = value;

  @action
  init({required int orderID}) async {

    scroll.addListener(() {

      if(scroll.position.pixels == scroll.position.maxScrollExtent && loading == false) {
        loadingMoreOrders();
      }

    });

    setLoading(true);

    (OrderEntity?, ProposalEntity?) result = await _getOrderDetailsWithoutEmployeeUsecase.call(orderID: orderID);

    order = result.$1;
    proposal = result.$2;

    if(proposal?.idProposta != null) {
      List<EmployeeUserEntity> resultEmployees =
      await _getEmployeeSelectionForJobUsecase.call(page: page, limit: limit, proposalID: proposal?.idProposta ?? 0);

      employees = resultEmployees.asObservable();
    }

    setLoading(false);
  }

  @action
  loadingMoreOrders() async {

    if (employees.length/limit >= 10) {

      addPagination();

      List<EmployeeUserEntity> result =
      await _getEmployeeSelectionForJobUsecase.call(page: page, limit: limit,
          proposalID: proposal?.idProposta ?? 0);

      if(result.isNotEmpty) {
        for(EmployeeUserEntity value in result) {
          if(employees.contains(value) == false) { employees.add(value); }
        }
      }

    } else {

      List<EmployeeUserEntity> result = await _getEmployeeSelectionForJobUsecase.call(
          page: page, limit: limit,
          proposalID: proposal?.idProposta ?? 0);

      if(result.isNotEmpty) {

        for(EmployeeUserEntity value in result) {
          if(employees.contains(value) == false) { employees.add(value); }
        }

      }
    }
  }
}