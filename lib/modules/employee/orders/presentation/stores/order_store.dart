import 'package:flutter/material.dart';
import 'package:marcenaria/core/data/entities/order_entity.dart';
import 'package:mobx/mobx.dart';

part 'order_store.g.dart';

class OrderStore = OrderStoreBase with _$OrderStore;

abstract class OrderStoreBase with Store {

  final PageController controller = PageController(initialPage: 0);

  @observable
  int index = 1;

  @observable
  ObservableList<OrderEntity> orders = <OrderEntity>[].asObservable();

  @action
  setIndex(int value) { index = value; controller.jumpToPage(index -1); }

}