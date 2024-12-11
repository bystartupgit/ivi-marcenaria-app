import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'navigation_store.g.dart';

class NavigationStore = NavigationStoreBase with _$NavigationStore;

abstract class NavigationStoreBase with Store {

  final PageController controller = PageController(initialPage: 0);

  @observable
  int index = 0;

  @action
  setIndex(int value) { index = value; controller.jumpToPage(index); }

}