

import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_without_proposal_entity.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_order_without_proposal_usecase.dart';
import 'package:mobx/mobx.dart';

part 'create_proposal_store.g.dart';

class CreateProposalStore = CreateProposalStoreBase with _$CreateProposalStore;

abstract class CreateProposalStoreBase with Store {

  final GetOrderWithoutProposalUsecase _getOrderDetailsUsecase = Modular.get<GetOrderWithoutProposalUsecase>();

  @observable
  OrderWithoutProposalEntity? order;

  @observable
  bool loading = true;

  @observable
  bool showMore = false;

  @action
  setShowMore() => showMore = !showMore;

  @action
  setLoading(bool value) => loading = value;

  @action
  init({required int orderID}) async {

    setLoading(true);

    order = await _getOrderDetailsUsecase.call(orderID: orderID);

    setLoading(false);

  }

}