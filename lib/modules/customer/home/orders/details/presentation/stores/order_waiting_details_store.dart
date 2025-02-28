import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/usecases/cancel_order_usecase.dart';
import 'package:marcenaria/modules/customer/home/orders/presentation/stores/order_store.dart';
import 'package:marcenaria/modules/login/domain/usecases/show_error_message_usecase.dart';
import 'package:mobx/mobx.dart';

part 'order_waiting_details_store.g.dart';

class OrderWaitingDetailsStore = OrderWaitingDetailsStoreBase with _$OrderWaitingDetailsStore;

abstract class OrderWaitingDetailsStoreBase with Store {

  final CancelOrderUsecase _cancelOrderUsecase = Modular.get<CancelOrderUsecase>();

  @observable
  bool showMore = false;

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @action
  setShowMore() => showMore = !showMore;

  @action
  cancelOrder({required OrderEntity order, required context}) async {

    try {

      setLoading(true);

      bool result = await _cancelOrderUsecase.call(orderID: order.id);

      if(result) { Modular.get<OrderStore>().removeWaitingOrders(order); Modular.to.pop(); }
      else {
        ShowErrorMessageUsecase(context: context)
          .call(message: "Não foi possível cancelar a proposta"); }
    } catch (e) { ShowErrorMessageUsecase(context: context)
        .call(message: "Não foi possível cancelar a proposta. Tente novamente mais tarde"); }
    finally { setLoading(false); }


  }

}