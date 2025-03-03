


import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/login/domain/usecases/send_reset_email_usecase.dart';
import 'package:marcenaria/modules/login/domain/usecases/show_error_message_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../domain/mappers/router_mapper.dart';

part 'reset_password_store.g.dart';

class ResetPasswordStore = ResetPasswordStoreBase with _$ResetPasswordStore;

abstract class ResetPasswordStoreBase with Store {

  final SendResetEmailUsecase _sendResetEmailUsecase = Modular.get<SendResetEmailUsecase>();

  @observable
  String email = "";

  @computed
  bool get emailNotEmpty => email.isNotEmpty;

  @action
  setEmail(String value) => email = value;

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @action
  sendEmailReset({required context}) async {

    try {

      setLoading(true);

      (String,bool) result = await _sendResetEmailUsecase.call(email: email);

      if(result.$2) { Modular.to.pushNamed(RouterMapper.resetPasswordCodeIntern); }
      else { ShowErrorMessageUsecase(context: context).call(message: result.$1); }

    }
    catch(e) { ShowErrorMessageUsecase(context: context).call(message: e.toString());}
    finally { setLoading(false); }

  }
}