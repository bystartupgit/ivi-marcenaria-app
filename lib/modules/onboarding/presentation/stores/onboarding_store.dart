import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'onboarding_store.g.dart';

class OnboardingStore = OnboardingStoreBase with _$OnboardingStore;

abstract class OnboardingStoreBase with Store {
  final PageController controller = PageController(initialPage: 0);

  @observable
  int index = 0;

  @action
  setPage(int value) {
    index = value;
    controller.jumpToPage(value);
  }
}
