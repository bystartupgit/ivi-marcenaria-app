

import 'package:mobx/mobx.dart';

import '../../../domain/usecases/show_error_message_usecase.dart';

part 'confirm_password_store.g.dart';

class ConfirmPasswordStore = ConfirmPasswordStoreBase with _$ConfirmPasswordStore;

abstract class ConfirmPasswordStoreBase with Store {

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
  confirmationPasswrod({required context}) async {

    try {

      if(passwordValid == false) {
        ShowErrorMessageUsecase(context: context).call(message: "Senha e Confirmar Senha não sáo válidas.");
      }

      setLoading(true);

      (String,bool) result = ("", true);

      if(result.$2) {}
      else { ShowErrorMessageUsecase(context: context).call(message: result.$1); }

    }
    catch(e) { ShowErrorMessageUsecase(context: context).call(message: e.toString());}
    finally { setLoading(false); }

  }
}