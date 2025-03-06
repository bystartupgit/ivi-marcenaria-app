import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/modules/employee/service/domain/usecases/get_service_production_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../../admin/domain/entities/order_entity.dart';

part 'production_store.g.dart';

class ProductionStore = ProductionStoreBase with _$ProductionStore;

abstract class ProductionStoreBase with Store implements Disposable {

  final ScrollController scroll= ScrollController();

  final GetServiceProductionUsecase _getServiceProductionUsecase = Modular.get<GetServiceProductionUsecase>();

  @observable
  int page = 1;

  @observable
  int limit = 10;

  @observable
  bool loading = false;

  @observable
  ObservableList<OrderEntity> orders = <OrderEntity>[].asObservable();

  @action
  setLoading(bool value) => loading = value;

  @action
  addPagination() => page++;

  @observable
  bool paginationLoading = false;

  @action
  removeOrderByID(int id) => orders.removeWhere((e) => e.id == id);

  @action
  setPaginationLoading(bool value) => paginationLoading = value;

  @action
  init() async {

    scroll.addListener(() {

      if(scroll.position.pixels == scroll.position.maxScrollExtent && loading == false) {
        loadingMoreOrders();
      }

    });

    List<OrderEntity> result = await _getServiceProductionUsecase.call(page: page, limit: limit,
        employeeID: Modular.get<CoreStore>().profile?.id ?? 0);

    orders = result.asObservable();
  }

  @action
  loadingMoreOrders() async {

    if (orders.length/limit >= page) {

      addPagination();

      setPaginationLoading(true);

      List<OrderEntity> result = await _getServiceProductionUsecase.call(page: page, limit: limit,
        employeeID: Modular.get<CoreStore>().profile?.id ?? 0);

      if(result.isNotEmpty) {

        for(OrderEntity value in result) {
          if(orders.contains(value) == false) { orders.add(value); }
        }

      }

      setPaginationLoading(false);
    } else {

      setPaginationLoading(true);

      List<OrderEntity> result = await _getServiceProductionUsecase.call(page: page, limit: limit,
          employeeID: Modular.get<CoreStore>().profile?.id ?? 0);

      if(result.isNotEmpty) {

        for(OrderEntity value in result) {
          if(orders.contains(value) == false) { orders.add(value); }
        }

      }

      setPaginationLoading(false);
    }

  }

  @override
  void dispose() {
    scroll.dispose();
  }
}