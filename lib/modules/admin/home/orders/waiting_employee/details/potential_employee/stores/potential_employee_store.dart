import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/login/domain/usecases/show_success_message_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../../login/domain/usecases/show_error_message_usecase.dart';
import '../../../../../../domain/entities/employee_user_entity.dart';
import '../../../../../../domain/usecases/get_employees_usecase.dart';
import '../../../../../../domain/usecases/save_potential_employee_usecase.dart';

part 'potential_employee_store.g.dart';

class PotentialEmployeeStore = PotentialEmployeeStoreBase
    with _$PotentialEmployeeStore;

abstract class PotentialEmployeeStoreBase with Store implements Disposable {
  ScrollController scroll = ScrollController();

  final _getEmployees = Modular.get<GetEmployeesUsecase>();
  final _savePotentialEmployee = Modular.get<SavePotentialEmployeeUsecase>();

  @observable
  Timer? debounce;

  @observable
  int page = 1;

  @observable
  ObservableList<EmployeeUserEntity> employees =
      <EmployeeUserEntity>[].asObservable();

  @observable
  ObservableList<EmployeeUserEntity> employeeSelected =
      <EmployeeUserEntity>[].asObservable();

  @computed
  bool get hasEmployeeSelected => employeeSelected.isNotEmpty;

  @action
  addSelection(EmployeeUserEntity value) => employeeSelected.add(value);

  @action
  removeSelection(EmployeeUserEntity value) => employeeSelected.remove(value);

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
  setFilter(String value, context) {
    name = value;

    if (debounce?.isActive ?? false) debounce?.cancel();

    debounce = Timer(const Duration(milliseconds: 500), () async {
      try {
        setLoading(true);

        page = 1;

        List<EmployeeUserEntity> result =
            await _getEmployees.call(page: page, limit: limit, name: name);

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
  init() async {
    scroll.addListener(() {
      if (scroll.position.pixels == scroll.position.maxScrollExtent &&
          loading == false) {
        loadingMoreOrders();
      }
    });

    List<EmployeeUserEntity> result =
        await _getEmployees.call(page: page, limit: limit);

    employees = result.asObservable();
  }

  @action
  loadingMoreOrders() async {
    if (employees.length / limit >= 10) {
      addPagination();

      List<EmployeeUserEntity> result =
          await _getEmployees.call(page: page, limit: limit);

      if (result.isNotEmpty) {
        for (EmployeeUserEntity value in result) {
          if (employees.contains(value) == false) {
            employees.add(value);
          }
        }
      }
    } else {
      List<EmployeeUserEntity> result =
          await _getEmployees.call(page: page, limit: limit);

      if (result.isNotEmpty) {
        for (EmployeeUserEntity value in result) {
          if (employees.contains(value) == false) {
            employees.add(value);
          }
        }
      }
    }
  }

  @action
  save({required context, required int proposalID}) async {
    try {
      setLoading(true);

      bool result = await _savePotentialEmployee.call(
          employeeIDs:
              List<int>.from(employeeSelected.map((e) => e.employeeID)),
          proposalID: proposalID);

      if (result) {
        ShowSuccessMessageUsecase(context: context)
            .call(message: 'Sucesso ao salvar os prestadores em potencial.');
      } else {
        ShowErrorMessageUsecase(context: context).call(
            message: 'Não foi possível salvar os prestadores em potencial.');
      }
    } catch (e) {
      ShowErrorMessageUsecase(context: context)
          .call(message: 'Erro ao tentar salvar prestadores em potencial.');
    } finally {
      setLoading(false);
    }
  }

  @override
  void dispose() {
    scroll.dispose();
  }
}
