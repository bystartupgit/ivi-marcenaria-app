import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/usecases/aprove_proposal_usecase.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/usecases/confirm_payment_usecase.dart';
import 'package:marcenaria/modules/customer/home/orders/presentation/stores/order_store.dart';
import 'package:marcenaria/modules/login/domain/usecases/show_error_message_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../data/routers/customer_routers.dart';

part 'payment_store.g.dart';

class PaymentStore = PaymentStoreBase with _$PaymentStore;

abstract class PaymentStoreBase with Store {
  final OrderStore order = Modular.get<OrderStore>();
  final ConfirmPaymentUsecase _confirmPaymentUsecase =
      Modular.get<ConfirmPaymentUsecase>();

  @observable
  int? option;

  @observable
  int proposalID = 0;

  @action
  setOrderID(int value) => proposalID = value;

  @action
  setOption(int? value) => option = value;

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @computed
  bool get hasOption => option != null;

  @action
  confirmPayment({required context}) async {
    try {
      setLoading(true);

      bool result = await _confirmPaymentUsecase.call(proposalID: proposalID);

      if (result) {
        Modular.to.pushNamed(CustomerRouters.paymentSuccessProposalIntern);
        order.removeProposalOrders(proposalID);
      } else {
        ShowErrorMessageUsecase(context: context).call(
            message: "Não foi possível confirmar o pagamento da proposta.");
      }
    } catch (e) {
      ShowErrorMessageUsecase(context: context).call(message: e.toString());
    } finally {
      setLoading(false);
    }
  }
}
