import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/domain/entities/conversation_order_entity.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecases/get_order_conversation_usecase.dart';

part 'conversations_store.g.dart';

class ConversationStore = ConversationStoreBase with _$ConversationStore;

abstract class ConversationStoreBase with Store {
  final GetPrivateConversationUsecase _getPrivateConversationUsecase =
      Modular.get<GetPrivateConversationUsecase>();

  @observable
  ObservableList<ConversationOrderEntity> conversations =
      <ConversationOrderEntity>[].asObservable();

  @observable
  ObservableList<ConversationOrderEntity> conversationWithFilter =
      <ConversationOrderEntity>[].asObservable();

  @observable
  bool loading = false;

  @action
  setloading(bool value) => loading = value;

  @observable
  String filter = "";

  @observable
  Timer? debounce;

  @observable
  String name = "";

  @observable
  int page = 1;

  @observable
  int limit = 50;

  @action
  init() async {
    setloading(true);

    List<ConversationOrderEntity> result = await _getPrivateConversationUsecase
        .call(page: page, limit: limit, title: name);

    conversations = result.asObservable();

    setloading(false);
  }

  @computed
  List<ConversationOrderEntity> get conversationFiltered {
    if (name.isEmpty) {
      return conversations;
    } else {
      return conversationWithFilter;
    }
  }

  @action
  setFilter(String value) {
    name = value;

    if (debounce?.isActive ?? false) debounce?.cancel();

    if (name.isEmpty) {
      return;
    }

    debounce = Timer(const Duration(milliseconds: 500), () async {
      try {
        setloading(true);

        page = 1;

        List<ConversationOrderEntity> result =
            await _getPrivateConversationUsecase.call(
                page: page, limit: limit, title: name);

        conversationWithFilter = result.asObservable();
      } catch (e) {
      } finally {
        setloading(false);
      }
    });
  }
}
