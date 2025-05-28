import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/login/domain/dto/register_dto.dart';
import 'package:marcenaria/modules/login/domain/enums/user_type_enum.dart';
import 'package:marcenaria/modules/login/domain/usecases/register_usecase.dart';
import 'package:marcenaria/modules/login/domain/usecases/show_error_message_usecase.dart';
import 'package:marcenaria/modules/login/domain/usecases/show_success_message_usecase.dart';
import 'package:mobx/mobx.dart';

part 'customer_register_store.g.dart';

class CustomerRegisterStore = CustomerRegisterStoreBase
    with _$CustomerRegisterStore;

abstract class CustomerRegisterStoreBase with Store {
  final RegisterUseCase _registerUseCase = Modular.get<RegisterUseCase>();

  @observable
  int index = 1;

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @observable
  ObservableList<String> jobs = <String>[].asObservable();

  @action
  addJob(String value) => jobs.add(value);

  @action
  removeJob(String value) => jobs.remove(value);

  @observable
  String email = "";

  @action
  setEmail(String value) => email = value;

  @observable
  String name = "";

  @action
  setName(String value) => name = value;

  @observable
  String phone = "";

  @action
  setPhone(String value) => phone = value;

  @observable
  String password = "";

  @action
  setPassword(String value) => password = value;

  @observable
  String cpf = "";

  @action
  setCPF(String value) => cpf = value;

  @action
  Future<void> register({required context}) async {
    try {
      setLoading(true);

      (String, bool) result = await _registerUseCase.call(
          dto: RegisterDTO(
              name: name,
              email: email,
              password: password,
              cpf: cpf,
              phone: phone,
              functions: jobs,
              type: UserType.cliente));

      if (result.$2) {
        ShowSuccessMessageUsecase(context: context)
            .call(message: ("Sucesso ao criar novo usuário"))
            .whenComplete(() => Modular.to.pop());
      } else {
        ShowErrorMessageUsecase(context: context).call(message: result.$1);
      }
    } catch (e) {
      ShowErrorMessageUsecase(context: context).call(message: e.toString());
    } finally {
      setLoading(false);
    }
  }
}
