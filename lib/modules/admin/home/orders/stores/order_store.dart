import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/home/orders/choice_employee/store/choice_employee_store.dart';
import 'package:marcenaria/modules/admin/home/orders/production/stores/production_store.dart';
import 'package:marcenaria/modules/admin/home/orders/waiting_employee/stores/waiting_employee_store.dart';
import 'package:mobx/mobx.dart';

part 'order_store.g.dart';

class OrderStore = OrderStoreBase with _$OrderStore;

abstract class OrderStoreBase with Store implements Disposable {
  final PageController controller = PageController(initialPage: 0);

  final WaitingEmployeeStore waitingEmployee =
      Modular.get<WaitingEmployeeStore>();
  final ChoiceEmployeeStore choiceEmployee = Modular.get<ChoiceEmployeeStore>();
  final ProductionStore productionStore = Modular.get<ProductionStore>();

  @observable
  int pageWaitingEmployees = 1;

  @observable
  int pageDeclinedEmployees = 1;

  @observable
  int limit = 10;

  @observable
  int index = 1;

  @action
  setIndex(int value) {
    index = value;
    controller.jumpToPage(index - 1);
  }

  init() async {
    try {
      choiceEmployee.init();
      waitingEmployee.init();
      productionStore.init();
    } catch (e) {}
  }

  @override
  void dispose() {
    controller.dispose();
  }
}
