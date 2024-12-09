import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = RegisterStoreBase with _$RegisterStore;

abstract class RegisterStoreBase with Store {

  final PageController controller = PageController(initialPage: 0);

  @observable
  int index = 1;

  @action
  setIndex(int value) { index = value; controller.jumpToPage(index -1); }

  @observable
  ObservableList<String> jobs = <String>[].asObservable();

  @action
  addJob(String value) => jobs.add(value);

  @action
  removeJob(String value) => jobs.remove(value);



}