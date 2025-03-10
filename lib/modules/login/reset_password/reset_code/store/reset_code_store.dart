import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/login/domain/usecases/validate_code_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/mappers/router_mapper.dart';
import '../../../domain/usecases/show_error_message_usecase.dart';

part 'reset_code_store.g.dart';

class ResetCodeStore = ResetCodeStoreBase with _$ResetCodeStore;

abstract class ResetCodeStoreBase with Store {

  final ValidateCodeUsecase _validateCodeUsecase = Modular.get<ValidateCodeUsecase>();

  @observable
  String code = "";

  @computed
  bool get codeComplete => code.length > 5;

  @action
  setCode(String value) => code = value;

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @action
  sendEmailReset({required context}) async {

    try {

      setLoading(true);

      (String,bool) result = await _validateCodeUsecase.call(code: code);

      if(result.$2) { Modular.to.pushNamed(RouterMapper.confirmPasswordIntern,arguments: code); }
      else { ShowErrorMessageUsecase(context: context).call(message: result.$1); }

    }
    catch(e) { ShowErrorMessageUsecase(context: context).call(message: e.toString());}
    finally { setLoading(false); }

  }
}