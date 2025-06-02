import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/entities/profile_entity.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/modules/customer/home/domain/usecases/get_user_usecase.dart';
import 'package:marcenaria/modules/customer/home/domain/usecases/register_fcm_token_usecase.dart';
import 'package:marcenaria/modules/login/domain/entities/auth_entity.dart';
import 'package:mobx/mobx.dart';

part 'navigation_store.g.dart';

class NavigationStore = NavigationStoreBase with _$NavigationStore;

abstract class NavigationStoreBase with Store {
  final GetUserUseCase _getUserUseCase = Modular.get<GetUserUseCase>();
  final RegisterFcmTokenUsecase _registerFcmTokenUsecase =
      Modular.get<RegisterFcmTokenUsecase>();

  final PageController controller = PageController(initialPage: 0);

  @observable
  int index = 0;

  @observable
  bool loading = true;

  @action
  setLoading(bool value) => loading = value;

  @action
  setIndex(int value) {
    index = value;
    controller.jumpToPage(index);
  }

  @action
  init() async {
    AuthEntity? auth = Modular.get<CoreStore>().auth;

    setLoading(true);


    print(auth);

    if (auth != null) {
      FirebaseMessaging messaging = FirebaseMessaging.instance;

      String? token = Platform.isIOS
          ? await messaging.getAPNSToken()
          : await messaging.getToken();

      ProfileEntity? profile =
          await _getUserUseCase.call(id: auth.id, type: auth.type);

      Modular.get<CoreStore>().setProfile(profile);
      Modular.get<CoreStore>().setPathImage(profile?.image);

      _registerFcmTokenUsecase.call(userID: auth.id, fcmToken: token ?? "");
    }

    setLoading(false);
  }
}
