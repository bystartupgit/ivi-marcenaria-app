import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/entities/order_entity.dart';
import 'package:marcenaria/modules/employee/orders/presentation/stores/waiting_interesting/stores/order_pending_store.dart';
import 'package:marcenaria/modules/employee/orders/presentation/stores/waiting_interesting/stores/waiting_interesting_store.dart';
import 'package:mobx/mobx.dart';

part 'order_store.g.dart';

class OrderStore = OrderStoreBase with _$OrderStore;

abstract class OrderStoreBase with Store {

  final WaitingInterestiongStore waitingInteresting = Modular.get<WaitingInterestiongStore>();
  final OrderPendingStore orderPendingStore = Modular.get<OrderPendingStore>();

  final PageController controller = PageController(initialPage: 0);

  @observable
  int index = 1;

  @action
  setIndex(int value) { index = value; controller.jumpToPage(index - 1); }

}