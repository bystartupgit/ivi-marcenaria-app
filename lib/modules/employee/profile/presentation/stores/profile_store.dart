

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;

import '../../../../../core/data/entities/profile_entity.dart';
import '../../../../../core/data/store/core_store.dart';
import '../../../../../core/permissions/gallery_permission_utils.dart';
import '../../../../customer/home/profile/domain/usecases/upload_profile_photo_usecase.dart';
import '../../../../login/domain/usecases/show_error_message_usecase.dart';
import '../../../../login/domain/usecases/show_success_message_usecase.dart';

part 'profile_store.g.dart';

class ProfileStore = ProfileStoreBase with _$ProfileStore;

abstract class ProfileStoreBase with Store {

  final UploadProfilePhotoUsecase _uploadProfilePhotoUsecase = Modular.get<UploadProfilePhotoUsecase>();

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController documentNumber = TextEditingController();

  @observable
  File? image;

  @observable
  String? pathImage;

  @action
  setImage(File value) => image = value;

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @action
  init() async {

    ProfileEntity? profile = Modular.get<CoreStore>().profile;

    pathImage = Modular.get<CoreStore>().pathImage?.split("/").last;
    if(profile != null) {

      name.text = profile.name;
      email.text = profile.email;
      phone.text = profile.phone;
      documentNumber.text = profile.cpf;
    }
  }

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


}