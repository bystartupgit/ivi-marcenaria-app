



import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/login/domain/usecases/show_error_message_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../domain/usecases/get_waiting_choice_employees_usecase.dart';


part 'choice_employee_store.g.dart';

class ChoiceEmployeeStore = ChoiceEmployeeStoreBase with _$ChoiceEmployeeStore;

abstract class ChoiceEmployeeStoreBase with Store implements Disposable {

  ScrollController scroll = ScrollController();

  final _getWaitingChoiceEmployeesUsecase = Modular.get<GetWaitingChoiceEmployeesUsecase>();

  @observable
  int page = 1;

  @observable
  int limit = 10;

  @observable
  ObservableList<OrderEntity> orders = <OrderEntity>[].asObservable();

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @observable
  bool paginationLoading = false;

  @action
  setPaginationLoading(bool value) => paginationLoading = value;

  @action
  addPagination() => page++;

  @action
  removeOrderByID(int id) => orders.removeWhere((e) => e.id == id);

  @action
  init() async {

    scroll.addListener(() {

      if(scroll.position.pixels == scroll.position.maxScrollExtent && loading == false) {
        loadingMoreOrders();
      }

    });

    List<OrderEntity> result = await _getWaitingChoiceEmployeesUsecase.call(page: page, limit: limit);

    orders = result.asObservable();

  }

  @action
  loadingNewOrders({required context}) async {

    try{

      setLoading(true);

      List<OrderEntity> result = await _getWaitingChoiceEmployeesUsecase.call(page: 1, limit: limit);

      for(OrderEntity value in result) {
        if(!orders.contains(value)) { orders.add(value); }
      }
    } catch(e) { ShowErrorMessageUsecase(context: context).call(message: "Falha ao buscar novos pedidos."); }
      finally { setLoading(false); }

  }

  @action
  loadingMoreOrders() async {

    if (orders.length/limit >= 10) {

      addPagination();

      setPaginationLoading(true);

      List<OrderEntity> result = await _getWaitingChoiceEmployeesUsecase.call(page: page, limit: limit);

      if(result.isNotEmpty) {

        for(OrderEntity value in result) {
          if(orders.contains(value) == false) { orders.add(value); }
        }

      }

      setPaginationLoading(false);
    } else {

      setPaginationLoading(true);

      List<OrderEntity> result = await _getWaitingChoiceEmployeesUsecase.call(page: page, limit: limit);

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