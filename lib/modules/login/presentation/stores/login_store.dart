

import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/modules/login/domain/entities/auth_entity.dart';
import 'package:marcenaria/modules/login/domain/enums/user_type_enum.dart';
import 'package:marcenaria/modules/login/domain/usecases/login_usecase.dart';
import 'package:marcenaria/modules/login/domain/usecases/show_error_message_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/data/router_global_mapper.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {

  final LoginUseCase _loginUseCase = Modular.get<LoginUseCase>();

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @observable
  String email = "";

  @action
  setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  setPassword(String value) => password = value;

  @computed
  bool get enableLogin => email.isNotEmpty && password.isNotEmpty;

  @action
  login({required context}) async {

    try {

      setLoading(true);

      (String, AuthEntity?) result = await _loginUseCase.call(email, password);

      AuthEntity? auth = result.$2;

      print(auth?.type);

      if (auth != null) {

        Modular.get<CoreStore>().setAuth(auth);

        return switch(auth.type) {
          UserType.cliente => Modular.to.navigate(RouterGlobalMapper.customer),
          UserType.prestador => Modular.to.navigate(RouterGlobalMapper.employee),
          UserType.administrador => Modular.to.navigate(RouterGlobalMapper.admin),
        };
      } else { ShowErrorMessageUsecase(context: context).call(message: result.$1); }
    }

    catch(e) { ShowErrorMessageUsecase(context: context).call(message: e.toString()); }

    finally { setLoading(false); }
  }
}