


import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_waiting_employees_usecase.dart';
import 'package:mobx/mobx.dart';

part 'waiting_employee_store.g.dart';

class WaitingEmployeeStore = WaitingEmployeeStoreBase with _$WaitingEmployeeStore;

abstract class WaitingEmployeeStoreBase with Store implements Disposable {

  ScrollController scroll= ScrollController();

  final _getWaitingEmployeesUsecase = Modular.get<GetWaitingEmployeesUsecase>();

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
  setPaginationLoading(bool value) => paginationLoading = value;

  @action
  init() async {

    scroll.addListener(() {

      if(scroll.position.pixels == scroll.position.maxScrollExtent && loading == false) {
        loadingMoreOrders();
      }

    });

    List<OrderEntity> result = await _getWaitingEmployeesUsecase.call(page: page, limit: limit);

    orders = result.asObservable();
  }

  @action
  loadingMoreOrders() async {

    if (orders.length/limit >= 10) {

      addPagination();

      setPaginationLoading(true);

      List<OrderEntity> result = await _getWaitingEmployeesUsecase.call(page: page, limit: limit);

      if(result.isNotEmpty) {

        for(OrderEntity value in result) {
          if(orders.contains(value) == false) { orders.add(value); }
        }

      }

      setPaginationLoading(false);
    } else {

      setPaginationLoading(true);

      List<OrderEntity> result = await _getWaitingEmployeesUsecase.call(page: page, limit: limit);

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