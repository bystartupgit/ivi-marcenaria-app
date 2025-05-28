import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/customer/home/proposal/domain/usecases/get_finished_orders_usecase.dart';
import 'package:marcenaria/modules/customer/home/proposal/domain/usecases/get_production_orders_usecase.dart';
import 'package:mobx/mobx.dart';

part 'proposal_store.g.dart';

class ProposalStore = ProposalStoreBase with _$ProposalStore;

abstract class ProposalStoreBase with Store {
  final GetProductionOrdersUsecase _getProductionOrdersUsecase =
      Modular.get<GetProductionOrdersUsecase>();
  final GetFinishedOrdersUsecase _getFinishedOrdersUsecase =
      Modular.get<GetFinishedOrdersUsecase>();

  @computed
  String get name => Modular.get<CoreStore>().profile?.name ?? "";

  final PageController controller = PageController(initialPage: 0);

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
  ObservableList<OrderEntity> productionOrders = <OrderEntity>[].asObservable();

  @observable
  ObservableList<OrderEntity> finishedOrders = <OrderEntity>[].asObservable();

  @computed
  List<OrderEntity> get productionOrdersFiltered {
    if (filter.isEmpty) {
      return productionOrders;
    } else {
      return productionOrders
          .where((e) => e.title.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
  }

  @computed
  List<OrderEntity> get finishedOrdersFiltered {
    if (filter.isEmpty) {
      return finishedOrders;
    } else {
      return finishedOrders
          .where((e) => e.title.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
  }

  @action
  setLoading(bool value) => loading = value;

  @action
  setFilter(String value) => filter = value;

  @action
  setIndex(int value) {
    index = value;
    controller.jumpToPage(index - 1);
  }

  @action
  init() async {
    if (productionOrders.isEmpty && loading == false) {
      setLoading(true);

      List<OrderEntity> orders = await _getProductionOrdersUsecase.call(
          customerID: Modular.get<CoreStore>().profile?.id ?? 0,
          page: pageWaiting,
          limit: limit);

      productionOrders = orders.asObservable();

      orders = await _getFinishedOrdersUsecase.call(
          customerID: Modular.get<CoreStore>().profile?.id ?? 0,
          page: pageWaiting,
          limit: limit);

      finishedOrders = orders.asObservable();

      setLoading(false);
    }
  }
}
