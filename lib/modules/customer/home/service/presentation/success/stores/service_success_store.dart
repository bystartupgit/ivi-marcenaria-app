


import 'package:mobx/mobx.dart';

part 'service_success_store.g.dart';

class ServiceSuccessStore = ServiceSuccessStoreBase with _$ServiceSuccessStore;

abstract class ServiceSuccessStoreBase with Store {

  @observable
  bool showMore = true;

  @action
  setShowMore() => showMore = !showMore;
}