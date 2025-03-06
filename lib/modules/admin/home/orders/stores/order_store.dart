


import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_declined_order_employees_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_waiting_employees_usecase.dart';
import 'package:marcenaria/modules/admin/home/orders/choice_employee/store/choice_employee_store.dart';
import 'package:marcenaria/modules/admin/home/orders/waiting_employee/stores/waiting_employee_store.dart';
import 'package:mobx/mobx.dart';

part 'order_store.g.dart';

class OrderStore = OrderStoreBase with _$OrderStore;

abstract class OrderStoreBase with Store implements Disposable {

  final PageController controller = PageController(initialPage: 0);

  final WaitingEmployeeStore waitingEmployee = Modular.get<WaitingEmployeeStore>();
  final ChoiceEmployeeStore choiceEmployee = Modular.get<ChoiceEmployeeStore>();

  @observable
  int pageWaitingEmployees = 1;

  @observable
  int pageDeclinedEmployees = 1;

  @observable
  int limit = 10;

  @observable
  int index = 1;

  @action
  setIndex(int value) { index = value; controller.jumpToPage(index -1); }

  init() async {

    try {

      choiceEmployee.init();
      waitingEmployee.init();

    }catch(e) {}

  }

  @override
  void dispose() {
    controller.dispose();
  }

}
