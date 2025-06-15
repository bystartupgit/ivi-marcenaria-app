import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/login/domain/entities/auth_entity.dart';
import 'package:mobx/mobx.dart';

import '../../../core/data/router_global_mapper.dart';
import '../../../core/data/store/core_store.dart';
import '../../login/domain/enums/user_type_enum.dart';
import '../../onboarding/domain/usecases/check_credential_usecase.dart';

part 'splash_store.g.dart';

class SplashStore = SplashStoreBase with _$SplashStore;

abstract class SplashStoreBase with Store {

  final CheckCredentialUseCase checkCredentialUseCase = CheckCredentialUseCase();

  @action
  init() async {

    AuthEntity? auth = await checkCredentialUseCase.call();

    if(auth != null) {
      Modular.get<CoreStore>().setAuth(auth);

      return switch (auth.type) {
        UserType.cliente => Modular.to.navigate(RouterGlobalMapper.customer),
        UserType.prestador => Modular.to.navigate(RouterGlobalMapper.employee),
        UserType.administrador => Modular.to.navigate(RouterGlobalMapper.admin),
      };
    } else { Modular.to.navigate(RouterGlobalMapper.onboarding); }
  }
}