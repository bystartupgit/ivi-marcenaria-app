import 'package:mobx/mobx.dart';

part 'conversation_store.g.dart';

class  ConversationStore = ConversationStoreBase with _$ConversationStore;

abstract class ConversationStoreBase with Store {

  @observable
  bool loading = false;

  @action
  setloading(bool value) => loading = value;

  @observable
  String filter = "";

  @action
  setFilter(String value) => filter = value;

}