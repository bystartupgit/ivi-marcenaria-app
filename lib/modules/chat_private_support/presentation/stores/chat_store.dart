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

abstract class ChatStoreBase with Store {

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
  int limit = 10;

  @action
  setPagination() => page++;

  @observable
  ScrollController scroll = ScrollController();

  @observable
  ObservableList<MessageEntity> messages = <MessageEntity>[].asObservable();

  @computed
  int get userID => Modular.get<CoreStore>().auth?.id ?? 0;

  @action
  sendMessage(String value) async {

    if(value.trim().isEmpty) { return; }

    _sendMessagesUseCase.call(dto: MessageSupportDTO(userID: userID, message: value,suportID: userID));

    messages.add(MessageEntity(id: 0, senderID: userID, message: value, date: DateTime.now()));

    controller.clear();

  }

  @action
  init() async {

    try {
      setLoading(true);

      List<MessageEntity> list = await _getMessagesUseCase.call(
          supportID: userID,
          page: page, limit: limit);

      if (list.isNotEmpty) {
        messages = list.asObservable();
      }
    }catch(e) { print(e); } finally { setLoading(false); }

  }
}