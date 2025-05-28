import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/proposal_entity.dart';
import 'package:marcenaria/modules/customer/home/orders/presentation/stores/order_store.dart';
import 'package:mobx/mobx.dart';

part 'conversation_store.g.dart';

class ConversationStore = ConversationStoreBase with _$ConversationStore;

abstract class ConversationStoreBase with Store {
  final OrderStore orders = Modular.get<OrderStore>();

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
    if (filter.isEmpty) {
      return orders.waitingOrders;
    } else {
      return orders.waitingOrders
          .where((e) => e.title.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
  }

  @computed
  List<ProposalEntity> get waitingApprovalFiltered {
    if (filter.isEmpty) {
      return orders.waitingApprovalOrders;
    } else {
      return orders.waitingApprovalOrders
          .where((e) =>
              e.pedido.titulo.toLowerCase().contains(filter.toLowerCase()))
          .toList();
    }
  }
}
