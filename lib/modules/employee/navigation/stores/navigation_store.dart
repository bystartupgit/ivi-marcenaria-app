import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:marcenaria/modules/employee/domain/entities/employee_entity.dart';
import 'package:marcenaria/modules/employee/domain/usecases/register_fcm_token_usecase.dart';
import 'package:marcenaria/modules/login/domain/entities/auth_entity.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/data/store/core_store.dart';
import '../../domain/usecases/get_user_usecase.dart';

part 'navigation_store.g.dart';

class NavigationStore = NavigationStoreBase with _$NavigationStore;

abstract class NavigationStoreBase with Store {
  final GetUserUseCase _getUserUseCase = Modular.get<GetUserUseCase>();
  final FlutterSecureStorage storage = Modular.get<FlutterSecureStorage>();
  final RegisterFcmTokenUsecase _registerFcmTokenUseCase =
      Modular.get<RegisterFcmTokenUsecase>();

  final PageController controller = PageController(initialPage: 0);

  @observable
  int index = 0;

  @observable
  bool loading = false;

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

    if (auth != null) {
      FirebaseMessaging messaging = FirebaseMessaging.instance;

      String? token = Platform.isIOS
          ? await messaging.getAPNSToken()
          : await messaging.getToken();

      EmployeeEntity? profile =
          await _getUserUseCase.call(id: auth.id, type: auth.type);

      Modular.get<CoreStore>().setProfile(profile);
      Modular.get<CoreStore>().setJobs(profile?.functions ?? []);
      Modular.get<CoreStore>().setPathImage(profile?.image);

      _registerFcmTokenUseCase.call(userID: auth.id, fcmToken: token ?? "");
    }

    setLoading(false);
  }

  @action
  logout() {

    AuthEntity? auth = Modular.get<CoreStore>().auth;

    if(auth != null) {
      _registerFcmTokenUseCase.call(userID: auth.id, fcmToken: "");
      storage.deleteAll();
    }
  }
}
