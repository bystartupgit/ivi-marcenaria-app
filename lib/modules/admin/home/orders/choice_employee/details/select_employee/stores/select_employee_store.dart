import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/domain/entities/employee_user_entity.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_employee_selection_for_job_usecase.dart';
import 'package:marcenaria/modules/login/domain/usecases/show_error_message_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../domain/usecases/save_employee_proposal_usecase.dart';

part 'select_employee_store.g.dart';

class SelectEmployeeStore = SelectEmployeeStoreBase with _$SelectEmployeeStore;

abstract class SelectEmployeeStoreBase with Store implements Disposable {
  ScrollController scroll = ScrollController();

  final _getEmployees = Modular.get<GetEmployeeSelectionForJobUsecase>();
  final _saveEmployeeProposalUseCase =
      Modular.get<SaveEmployeeProposalUseCase>();

  @observable
  Timer? debounce;

  @observable
  int page = 1;

  @observable
  ObservableList<EmployeeUserEntity> employees =
      <EmployeeUserEntity>[].asObservable();

  @observable
  EmployeeUserEntity? employeedSelected;

  @computed
  bool get hasSelected => employeedSelected != null;

  @action
  setSelectEmployee(EmployeeUserEntity? value) => employeedSelected = value;

  @observable
  int limit = 10;

  @observable
  String name = "";

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @action
  addPagination() => page++;

  @action
  setFilter(String value, context, int proposalID) {
    name = value;

    if (debounce?.isActive ?? false) debounce?.cancel();

    debounce = Timer(const Duration(milliseconds: 500), () async {
      try {
        setLoading(true);

        page = 1;

        List<EmployeeUserEntity> result = await _getEmployees.call(
            page: page, limit: limit, proposalID: proposalID);

        employees = result.asObservable();
      } catch (e) {
        ShowErrorMessageUsecase(context: context)
            .call(message: "Não foi possível pesquisar novos prestadores.");
      } finally {
        setLoading(false);
      }
    });
  }

  @action
  init({required proposalID}) async {
    scroll.addListener(() {
      if (scroll.position.pixels == scroll.position.maxScrollExtent &&
          loading == false) {
        loadingMoreOrders();
      }
    });

    List<EmployeeUserEntity> result = await _getEmployees.call(
        page: page, limit: limit, proposalID: proposalID);

    employees = result.asObservable();
  }

  @action
  loadingMoreOrders() async {
    print("pagination");
  }

  @action
  save({required context, required proposalID}) async {
    try {
      (String, bool) result = await _saveEmployeeProposalUseCase.call(
          proposalID: proposalID,
          employeeID: employeedSelected?.employeeID ?? 0);

      if (result.$2) {
        Navigator.pop(context);
        Modular.to.pop(true);
      } else {
        ShowErrorMessageUsecase(context: context).call(message: result.$1);
      }
    } catch (e) {
      ShowErrorMessageUsecase(context: context).call(message: e.toString());
    }
  }

  @override
  void dispose() {
    scroll.dispose();
  }
}
