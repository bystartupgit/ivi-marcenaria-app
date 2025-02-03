

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/modules/customer/home/domain/usecases/get_user_usecase.dart';
import 'package:marcenaria/modules/login/domain/entities/auth_entity.dart';
import 'package:mobx/mobx.dart';

part 'navigation_store.g.dart';

class NavigationStore = NavigationStoreBase with _$NavigationStore;

abstract class NavigationStoreBase with Store {

  final GetUserUseCase _getUserUseCase = Modular.get<GetUserUseCase>();

  final PageController controller = PageController(initialPage: 0);

  @observable
  int index = 0;

  @observable
  bool loading = true;

  @action
  setLoading(bool value) => loading = value;

  @action
  setIndex(int value) { index = value; controller.jumpToPage(index); }

  @action
  init() async {

    AuthEntity? auth = Modular.get<CoreStore>().auth;

    setLoading(true);

    print("a");

    if(auth != null) { _getUserUseCase.call(id: auth.id, type: auth.type); }

    setLoading(false);


  }

}