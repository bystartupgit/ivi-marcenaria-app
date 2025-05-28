import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'employee_store.g.dart';

class EmployeeStore = EmployeeStoreBase with _$EmployeeStore;

abstract class EmployeeStoreBase with Store implements Disposable {
  ScrollController scroll = ScrollController();

  @observable
  int page = 1;

  @observable
  int limit = 10;

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @action
  addPagination() => page++;

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
