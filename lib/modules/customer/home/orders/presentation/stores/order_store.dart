

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/usecases/get_waiting_approval_orders_usecase.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/usecases/get_waiting_orders_usecase.dart';
import 'package:mobx/mobx.dart';


part 'order_store.g.dart';

class OrderStore = OrderStoreBase with _$OrderStore;

abstract class OrderStoreBase with Store {

  final GetWaitingOrdersUsecase _getWaitingOrdersUsecase = Modular.get<GetWaitingOrdersUsecase>();
  final GetWaitingApprovalOrdersUsecase _getWaitingApprovalOrdersUsecase = Modular.get<GetWaitingApprovalOrdersUsecase>();

  final PageController controller = PageController(initialPage: 0);

  @computed
  String get name => Modular.get<CoreStore>().profile?.name ?? "";

  @observable
  int index = 1;

  @observable
  int pageWaiting = 1;

  @observable
  int limit = 10;
  
  @observable
  String filter = "";

  @observable
  bool loading = false;

  @observable
  ObservableList<OrderEntity> orders = <OrderEntity>[].asObservable();

  @observable
  ObservableList<OrderEntity> waitingOrders = <OrderEntity>[].asObservable();

  @observable
  ObservableList<OrderEntity> waitingApprovalOrders = <OrderEntity>[].asObservable();
  
  @computed
  List<OrderEntity> get waitingOrdersFiltered {
    if(filter.isEmpty) { return waitingOrders; }
    else { return waitingOrders.where((e) => e.title.toLowerCase().contains(filter.toLowerCase())).toList(); }
  }

  @computed
  List<OrderEntity> get waitingApprovalOrdersFiltered {

    if(filter.isEmpty) { return waitingApprovalOrders; }
    else { return waitingApprovalOrders.where((e) => e.title.toLowerCase().contains(filter.toLowerCase())).toList(); }
  }

  @action
  setLoading(bool value) => loading = value;

  @action
  setFilter(String value) => filter = value;

  @action
  setIndex(int value) { index = value; controller.jumpToPage(index -1); }

  @action
  removeWaitingOrders(OrderEntity order) => waitingOrders.remove(order);

  @action
  addWaigintOrders(OrderEntity order) => waitingOrders.add(order);

  @action
  init() async {

    if(waitingOrders.isEmpty && loading == false) {

      setLoading(true);

      List<OrderEntity> orders = await _getWaitingOrdersUsecase.call(
          customerID: Modular
              .get<CoreStore>()
              .profile
              ?.id ?? 0,
          page: pageWaiting, limit: limit);

      waitingOrders = orders.asObservable();

      orders = await _getWaitingApprovalOrdersUsecase.call(customerID: Modular
          .get<CoreStore>()
          .profile
          ?.id ?? 0,
          page: pageWaiting, limit: limit);

      waitingApprovalOrders = orders.asObservable();

      setLoading(false);
    }
  }

}