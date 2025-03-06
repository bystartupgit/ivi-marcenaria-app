import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/employee/service/presentation/finish/stores/finish_store.dart';
import 'package:marcenaria/modules/employee/service/presentation/production/stores/production_store.dart';
import 'package:mobx/mobx.dart';

part 'service_store.g.dart';

class ServiceStore = ServiceStoreBase with _$ServiceStore;

abstract class ServiceStoreBase with Store {

  final ProductionStore production = Modular.get<ProductionStore>();
  final FinishStore finish = Modular.get<FinishStore>();

  final PageController controller = PageController(initialPage: 0);

  @observable
  int index = 1;

  @action
  setIndex(int value) { index = value; controller.jumpToPage(index - 1); }

}