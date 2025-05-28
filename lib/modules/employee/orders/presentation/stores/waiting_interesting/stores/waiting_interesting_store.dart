import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:mobx/mobx.dart';

import '../../../../domain/usecases/get_waiting_interest_orders_usecase.dart';

part 'waiting_interesting_store.g.dart';

class WaitingInterestiongStore = WaitingInterestiongStoreBase
    with _$WaitingInterestiongStore;

abstract class WaitingInterestiongStoreBase with Store implements Disposable {
  final GetWaitingInterestOrdersUsecase _getWaitingInterestOrdersUsecase =
      Modular.get<GetWaitingInterestOrdersUsecase>();

  ScrollController scroll = ScrollController();

  @observable
  int page = 1;

  @observable
  int limit = 10;

  @observable
  bool loading = false;

  @observable
  ObservableList<OrderEntity> orders = <OrderEntity>[].asObservable();

  @action
  removeOrderByID(int id) => orders.removeWhere((e) => e.id == id);

  @action
  setLoading(bool value) => loading = value;

  @action
  setPagination() => page++;

  @action
  init() async {
    try {
      setLoading(true);

      List<OrderEntity> result = await _getWaitingInterestOrdersUsecase.call(
          employeeID: Modular.get<CoreStore>().profile?.id ?? 0,
          page: page,
          limit: limit);

      orders = result.asObservable();
    } finally {
      setLoading(false);
    }
  }

  @override
  void dispose() {
    scroll.dispose();
  }
}
