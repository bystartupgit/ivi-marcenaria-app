import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/entities/profile_entity.dart';
import 'package:marcenaria/modules/customer/home/profile/domain/usecases/update_profile_usecase.dart';
import 'package:marcenaria/modules/login/domain/usecases/show_error_message_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../../core/data/store/core_store.dart';
import '../../../../../../login/domain/usecases/show_success_message_usecase.dart';
import '../../../domain/dtos/profile_dto.dart';

part 'profile_form_store.g.dart';

class ProfileFormStore = ProfileFormStoreBase with _$ProfileFormStore;

abstract class ProfileFormStoreBase with Store {

  final UpdateProfileUsecase _updateProfileUsecase = Modular.get<UpdateProfileUsecase>();

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController documentNumber = TextEditingController();

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @action
  init() async {

    ProfileEntity? profile = Modular.get<CoreStore>().profile;

    if(profile != null) {
      name.text = profile.name;
      email.text = profile.email;
      phone.text = profile.phone;
      documentNumber.text = profile.cpf;
    }
  }

  @action
  update({required context}) async {

    try{

      setLoading(true);

      bool result = await _updateProfileUsecase.call(userID: Modular.get<CoreStore>().auth?.id ?? 0,
          dto: profile);

      if(result) { ShowSuccessMessageUsecase(context: context).call(message: "Sucesso ao atualizar os dados de perfil.");

        CoreStore core = Modular.get<CoreStore>();

        core.setProfile(core.profile?.copyWith(
            name: name.text,
            phone: phone.text,
            cpf: documentNumber.text.isEmpty? "" : documentNumber.text.replaceAll(".", "").replaceAll("-", ""),
            email: email.text
        ));
      } else {
        ShowErrorMessageUsecase(context: context ).call(message: "Não foi possível atualizar os dados do perfil");
      }


    }catch(e) { ShowErrorMessageUsecase(context: context ).call(message: e.toString()); }
    finally{ setLoading(false); }


  }

  ProfileDTO get profile => ProfileDTO(name: name.text, email: email.text,
      cpf: documentNumber.text, phone: phone.text);


}