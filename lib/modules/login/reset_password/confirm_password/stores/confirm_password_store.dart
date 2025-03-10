

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/login/domain/usecases/reset_password_usecase.dart';
import 'package:marcenaria/modules/login/domain/usecases/show_success_message_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/usecases/show_error_message_usecase.dart';

part 'confirm_password_store.g.dart';

class ConfirmPasswordStore = ConfirmPasswordStoreBase with _$ConfirmPasswordStore;

abstract class ConfirmPasswordStoreBase with Store {

  final ResetPasswordUsecase _resetPasswordUsecase = Modular.get<ResetPasswordUsecase>();

  @observable
  String password = "";

  @observable
  String confirmPassword = "";

  @computed
  bool get passwordValid => password.isNotEmpty
      && confirmPassword.isNotEmpty && password == confirmPassword;

  @action
  setPassword(String value) => password = value;

  @action
  setConfirmPassword(String value) => confirmPassword = value;

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @action
  confirmationPassword({required context, required String code}) async {

    try {

      if(passwordValid == false) {
        ShowErrorMessageUsecase(context: context).call(message: "Senha e Confirmar Senha não sáo válidas.");
      }

      setLoading(true);

      (String,bool) result = await _resetPasswordUsecase.call(code: code, password: password);

      if(result.$2) {
        ShowSuccessMessageUsecase(context: context).call(message: "Sucesso ao redefinir senha").whenComplete(() => Modular.to.popUntil(ModalRoute.withName(Modular.initialRoute)));
      }
      else { ShowErrorMessageUsecase(context: context).call(message: result.$1); }

    }
    catch(e) { ShowErrorMessageUsecase(context: context).call(message: e.toString());}
    finally { setLoading(false); }

  }
}