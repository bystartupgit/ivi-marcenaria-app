import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/login/domain/dto/register_dto.dart';
import 'package:marcenaria/modules/login/domain/enums/user_type_enum.dart';
import 'package:marcenaria/modules/login/domain/usecases/register_usecase.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = RegisterStoreBase with _$RegisterStore;

abstract class RegisterStoreBase with Store {

  final RegisterUseCase _registerUseCase = Modular.get<RegisterUseCase>();

  final PageController controller = PageController(initialPage: 0);

  @observable
  int index = 1;

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @action
  setIndex(int value) { index = value; controller.jumpToPage(index -1); }

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
  Future<void> register() async {

    try {

      setLoading(true);

      _registerUseCase.call(dto: RegisterDTO(name: name, email: email,
          password: password, cpf: cpf, phone: phone,
          type: index == 1 ? UserType.cliente : UserType.prestador));

    } catch(e) {}
    finally { setLoading(false); }


  }





}