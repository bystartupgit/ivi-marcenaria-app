import 'package:carousel_slider/carousel_options.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  int index = 0;

  @action
  setIndex(int value, CarouselPageChangedReason reason) => index = value;
}
