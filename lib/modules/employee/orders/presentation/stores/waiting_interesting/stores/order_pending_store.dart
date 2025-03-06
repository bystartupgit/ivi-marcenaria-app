

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/employee/orders/domain/usecases/get_order_not_started_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../../core/data/store/core_store.dart';
import '../../../../../../admin/domain/entities/order_entity.dart';

part 'order_pending_store.g.dart';

class OrderPendingStore = OrderPendingStoreBase with _$OrderPendingStore;

abstract class OrderPendingStoreBase with Store implements Disposable {

  final GetOrderNotStartedUsecase _getOrderNotStartedUsecase = Modular.get<GetOrderNotStartedUsecase>();

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

      List<OrderEntity> result = await _getOrderNotStartedUsecase.call(
          employeeID: Modular.get<CoreStore>().profile?.id ?? 0, page: page, limit: limit);

      orders = result.asObservable();

    } finally { setLoading(false); }

  }

  @override
  void dispose() {
    scroll.dispose();
  }
}