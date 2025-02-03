


import 'package:mobx/mobx.dart';

import '../../../modules/login/domain/entities/auth_entity.dart';

part 'core_store.g.dart';

class CoreStore = CoreStoreBase with _$CoreStore;

abstract class CoreStoreBase with Store {

  @observable
  AuthEntity? auth;

  @action
  setAuth(AuthEntity value) => auth = value;

}