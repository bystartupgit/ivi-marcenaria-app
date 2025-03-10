import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/modules/chat_private_support/domain/usecases/get_messages_support_usecase.dart';
import 'package:marcenaria/modules/chat_private_support/domain/usecases/send_message_support_usecase.dart';
import 'package:marcenaria/modules/chat_support/domain/dto/message_support_dto.dart';
import 'package:mobx/mobx.dart';

import '../../domain/entities/message_entity.dart';

part 'chat_store.g.dart';

class ChatStore = ChatStoreBase with _$ChatStore;

abstract class ChatStoreBase with Store implements Disposable {

  final SendMessagesSupportUseCase _sendMessagesUseCase = Modular.get<SendMessagesSupportUseCase>();
  final GetMessagesSupportUseCase _getMessagesUseCase = Modular.get<GetMessagesSupportUseCase>();

  final TextEditingController controller = TextEditingController();
  final FocusNode focus = FocusNode();

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @observable
  int page = 1;

  @observable
  int limit = 20;

  @action
  setPagination() => page++;

  @observable
  ScrollController scroll = ScrollController();

  @observable
  ObservableList<MessageEntity> messages = <MessageEntity>[].asObservable();

  @computed
  int get userID => Modular.get<CoreStore>().auth?.id ?? 0;

  @action
  sendMessage(String value, int id) async {

    if(value.trim().isEmpty) { return; }

    await _sendMessagesUseCase.call(dto: MessageSupportDTO(userID: userID, message: value, suportID: id));

    await loadingMoreMessages(id: id);

    controller.clear();

  }

  @action
  init({required int id}) async {

    scroll.addListener(() {

      if(scroll.position.pixels == scroll.position.maxScrollExtent && loading == false) {
        loadingMoreMessages(id: id);
      }

    });

    try {

      setLoading(true);

      List<MessageEntity> list = await _getMessagesUseCase.call(
          supportID: id,
          page: page, limit: limit);

      if (list.isNotEmpty) {
        messages = list.asObservable();
      }
    }catch(e) {} finally { setLoading(false); }

  }

  @action
  loadingMoreMessages({required int id}) async {
    if (messages.length / limit == page) {

      setPagination();

      List<MessageEntity> result = await _getMessagesUseCase.call(page: page, limit: limit,supportID: id);

      if(result.isNotEmpty) {

        for(MessageEntity value in result) {
          if(messages.contains(value) == false) { messages.add(value); }
        }
      }

    } else {

      List<MessageEntity> result = await _getMessagesUseCase.call(page: page, limit: limit,supportID: id);

      if(result.isNotEmpty) {

        for(MessageEntity value in result) {
          if(messages.contains(value) == false) { messages.add(value); }
        }

      }

    }
  }

  @override
  void dispose() {
    scroll.dispose();
  }
}