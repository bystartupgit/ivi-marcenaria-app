import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_waiting_proposal_usecase.dart';
import 'package:mobx/mobx.dart';

part 'proposal_store.g.dart';

class ProposalStore = ProposalStoreBase with _$ProposalStore;

abstract class ProposalStoreBase with Store {

  final GetWaitingProposalUsecase _getWaitingProposalUsecase = Modular.get<GetWaitingProposalUsecase>();

  final PageController controller = PageController(initialPage: 0);

  @observable
  int index = 1;

  @observable
  int pageWaiting = 1;

  @observable
  int limit = 10;

  @observable
  String filter = "";

  @observable
  bool loading = false;

  @observable
  ObservableList<OrderEntity> waitingProposal = <OrderEntity>[].asObservable();

  @observable
  ObservableList<OrderEntity> waitingAproval = <OrderEntity>[].asObservable();

  @computed
  List<OrderEntity> get waitingProposalFiltered {
    if(filter.isEmpty) { return waitingProposal; }
    else { return waitingProposal.where((e) => e.title.toLowerCase().contains(filter.toLowerCase())).toList(); }
  }

  @computed
  List<OrderEntity> get waitingAprovalFiltered {

    if(filter.isEmpty) { return waitingAproval; }
    else { return waitingAproval.where((e) => e.title.toLowerCase().contains(filter.toLowerCase())).toList(); }
  }

  @action
  setLoading(bool value) => loading = value;

  @action
  setFilter(String value) => filter = value;

  @action
  setIndex(int value) { index = value; controller.jumpToPage(index -1); }

  @action
  init() async {

    if(waitingProposal.isEmpty && loading == false) {

      setLoading(true);

      List<OrderEntity> orders = await _getWaitingProposalUsecase.call(
          page: pageWaiting, limit: limit);

      waitingProposal = orders.asObservable();

      setLoading(false);
    }
  }

}