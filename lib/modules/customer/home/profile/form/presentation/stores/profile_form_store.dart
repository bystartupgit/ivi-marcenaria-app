import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marcenaria/core/data/entities/profile_entity.dart';
import 'package:marcenaria/modules/customer/home/profile/domain/usecases/update_profile_usecase.dart';
import 'package:marcenaria/modules/login/domain/usecases/show_error_message_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';


import '../../../../../../../core/data/store/core_store.dart';
import '../../../../../../../core/permissions/gallery_permission_utils.dart';
import '../../../../../../login/domain/usecases/show_success_message_usecase.dart';
import '../../../domain/dtos/profile_dto.dart';
import '../../../domain/usecases/upload_profile_photo_usecase.dart';

part 'profile_form_store.g.dart';

class ProfileFormStore = ProfileFormStoreBase with _$ProfileFormStore;

abstract class ProfileFormStoreBase with Store {

  final UploadProfilePhotoUsecase _uploadProfilePhotoUsecase = Modular.get<UploadProfilePhotoUsecase>();
  final UpdateProfileUsecase _updateProfileUsecase = Modular.get<UpdateProfileUsecase>();

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController documentNumber = TextEditingController();

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @observable
  File? image;

  @action
  setImage(File? value) => image = value;

  @action
  uploadImage({required context}) async {
    try{

      setLoading(true);

      bool result = await getProfilePhoto(context: context);

      if(result) {

        int customerID = Modular.get<CoreStore>().profile?.id ?? 0;

        bool result = await _uploadProfilePhotoUsecase.call(customerID: customerID, name: path.basename(image!.path), photo: image!);

        if(result) {
          ShowSuccessMessageUsecase(context: context).call(message: "Sucesso ao inserir a nova foto.");
        } else { ShowErrorMessageUsecase(context: context).call(message: "Não foi possível inserir uma nova foto."); }
      }

    } catch(e) { ShowErrorMessageUsecase(context: context)
        .call(message: "Não foi possível atualizar a foto de perfil. Tente novamente mais tarde."); } finally { setLoading(false); }

  }


  @action
  Future<bool> getProfilePhoto({ required context }) async {

    PermissionStatus permission = await GalleryPermission().call();

    if(permission.isGranted) {

      XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (file != null) {

        final File result = File(file.path);

        image = result;

        return true;
      }

      return false;

    } else { ShowErrorMessageUsecase(context: context)
        .call(message: "Você precisa permitir que o Marcenaria APP acesse "
        "a galeria do seu dispositivo para incluir uma foto de perfil.");

    return false;
    }
  }

  @action
  init() async {

    ProfileEntity? profile = Modular.get<CoreStore>().profile;
    File? photo = Modular.get<CoreStore>().image;

    if(profile != null) {
      name.text = profile.name;
      email.text = profile.email;
      phone.text = profile.phone;
      documentNumber.text = profile.cpf;
    }

    image = photo;

  }

  @action
  update({required context}) async {

    try {

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