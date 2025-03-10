import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_all_conclusion_orders_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../login/domain/usecases/show_error_message_usecase.dart';
import '../../../domain/entities/order_entity.dart';

part 'conclusion_store.g.dart';

class ConclusionStore = ConclusionStoreBase with _$ConclusionStore;

abstract class ConclusionStoreBase with Store implements Disposable {

  ScrollController scroll = ScrollController();

  final GetAllConclusionOrdersUsecase _getAllConclusionOrdersUsecase = Modular.get<GetAllConclusionOrdersUsecase>();

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

    List<OrderEntity> result = await _getAllConclusionOrdersUsecase.call(page: page, limit: limit);

    orders = result.asObservable();

  }

  @action
  loadingNewOrders({required context}) async {

    try{

      setLoading(true);

      List<OrderEntity> result = await _getAllConclusionOrdersUsecase.call(page: 1, limit: limit);

      for(OrderEntity value in result) {
        if(!orders.contains(value)) { orders.add(value); }
      }
    } catch(e) { ShowErrorMessageUsecase(context: context).call(message: "Falha ao buscar novos pedidos."); }
    finally { setLoading(false); }

  }

  @action
  loadingMoreOrders() async {

    if (orders.length/limit >= page) {

      addPagination();

      setPaginationLoading(true);

      List<OrderEntity> result = await _getAllConclusionOrdersUsecase.call(page: page, limit: limit);

      if(result.isNotEmpty) {

        for(OrderEntity value in result) {
          if(orders.contains(value) == false) { orders.add(value); }
        }
      }

      setPaginationLoading(false);
    } else {

      setPaginationLoading(true);

      List<OrderEntity> result = await _getAllConclusionOrdersUsecase.call(page: page, limit: limit);

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