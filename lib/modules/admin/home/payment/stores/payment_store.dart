import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/entities/order_without_proposal_entity.dart';
import '../../../domain/usecases/get_order_without_proposal_usecase.dart';

part 'payment_store.g.dart';

class PaymentStore = PaymentStoreBase with _$PaymentStore;

abstract class PaymentStoreBase with Store {
  final GetOrderWithoutProposalUsecase _getOrderDetailsUsecase =
      Modular.get<GetOrderWithoutProposalUsecase>();

  @observable
  OrderWithoutProposalEntity? order;

  @observable
  bool moreDetails = true;

  @action
  changeMoreDetails() => moreDetails = !moreDetails;

  @observable
  bool loading = true;

  @action
  setLoading(bool value) => loading = value;

  @action
  init({required int orderID}) async {
    setLoading(true);

    order = await _getOrderDetailsUsecase.call(orderID: orderID);

    setLoading(false);
  }
}
