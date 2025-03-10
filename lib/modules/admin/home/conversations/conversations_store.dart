import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/home/proposal/presentation/stores/proposal_store.dart';
import 'package:mobx/mobx.dart';

import '../../domain/entities/order_entity.dart';

part 'conversations_store.g.dart';

class  ConversationStore = ConversationStoreBase with _$ConversationStore;

abstract class ConversationStoreBase with Store {

  final ProposalStore proposal = Modular.get<ProposalStore>();

  @observable
  ObservableList<String> conversations = <String>[].asObservable();

  @observable
  bool loading = false;

  @action
  setloading(bool value) => loading = value;

  @observable
  String filter = "";

  @action
  setFilter(String value) => filter = value;

  @computed
  List<OrderEntity> get waitingOrdersFiltered {

    if(filter.isEmpty) { return proposal.waitingProposal; }
    else { return proposal.waitingProposal.where((e) => e.title.toLowerCase().contains(filter.toLowerCase())).toList(); }
  }

  @computed
  List<OrderEntity> get waitingApprovalFiltered {

    if(filter.isEmpty) { return proposal.waitingAproval; }
    else { return proposal.waitingAproval.where((e) => e.title.toLowerCase().contains(filter.toLowerCase())).toList(); }
  }

}