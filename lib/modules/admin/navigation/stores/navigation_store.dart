import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_user_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/register_fcm_token_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/data/entities/profile_entity.dart';
import '../../../../core/data/router_global_mapper.dart';
import '../../../../core/data/store/core_store.dart';
import '../../../customer/data/exceptions/token_expiration_exception.dart';
import '../../../login/domain/entities/auth_entity.dart';

part 'navigation_store.g.dart';

class NavigationStore = NavigationStoreBase with _$NavigationStore;

abstract class NavigationStoreBase with Store {
  final GetUserUseCase _getUserUseCase = Modular.get<GetUserUseCase>();
  final FlutterSecureStorage storage = Modular.get<FlutterSecureStorage>();
  final RegisterFcmTokenUsecase _registerFcmTokenUseCase = Modular.get<RegisterFcmTokenUsecase>();

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
  init(context) async {
    AuthEntity? auth = Modular.get<CoreStore>().auth;

    setLoading(true);

    if (auth != null) {
      FirebaseMessaging messaging = FirebaseMessaging.instance;

      String? token = Platform.isIOS
          ? await messaging.getAPNSToken()
          : await messaging.getToken();

      try {
        ProfileEntity? profile =
        await _getUserUseCase.call(id: auth.id, type: auth.type);

        Modular.get<CoreStore>().setProfile(profile);

        _registerFcmTokenUseCase.call(userID: auth.id, fcmToken: token ?? "");


      } on TokenExpiredException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message)));
        _registerFcmTokenUseCase.call(userID: auth.id, fcmToken: "");
        storage.deleteAll();
        Modular.to.pushReplacementNamed(RouterGlobalMapper.login);
      }
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
