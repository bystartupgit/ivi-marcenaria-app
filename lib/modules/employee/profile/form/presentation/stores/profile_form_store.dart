import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marcenaria/modules/employee/domain/usecases/update_profile_employee_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../../core/data/store/core_store.dart';
import '../../../../../../../core/permissions/gallery_permission_utils.dart';
import '../../../../../../core/data/entities/profile_entity.dart';
import '../../../../../login/domain/usecases/show_error_message_usecase.dart';
import '../../../../../login/domain/usecases/show_success_message_usecase.dart';
import '../../../../domain/dto/profile_dto.dart';
import '../../../../domain/usecases/register_user_document_usecase.dart';
import '../../../../domain/usecases/register_user_photo_usecase.dart';

part 'profile_form_store.g.dart';

class ProfileFormStore = ProfileFormStoreBase with _$ProfileFormStore;

abstract class ProfileFormStoreBase with Store {
  final RegisterUserDocumentUsecase _registerUserDocumentUsecase =
      Modular.get<RegisterUserDocumentUsecase>();
  final RegisterUserPhotoUsecase _registerUserPhotoUsecase =
      Modular.get<RegisterUserPhotoUsecase>();
  final UpdateProfileEmployeeUsecase _updateProfileEmployeeUsecase =
      Modular.get<UpdateProfileEmployeeUsecase>();

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController documentNumber = TextEditingController();

  @observable
  bool loading = false;

  @observable
  ObservableList<String> jobs = <String>[].asObservable();

  @observable
  File? workDocument;

  @observable
  List<File> marcenaria = <File>[].asObservable();

  @action
  addJob(String value) => jobs.add(value);

  @action
  removeJob(String value) => jobs.remove(value);

  @action
  setLoading(bool value) => loading = value;

  @observable
  File? image;

  @observable
  String? pathImage;

  @action
  setImage(File? value) => image = value;

  @action
  uploadImage({required context}) async {
    try {
      setLoading(true);

      bool result = await getProfilePhoto(context: context);

      if (result) {
        int employeeID = Modular.get<CoreStore>().profile?.id ?? 0;

        bool result = await _registerUserPhotoUsecase.call(
            employeeID: employeeID,
            name: path.basename(image!.path),
            photo: image!);

        if (result) {
          ShowSuccessMessageUsecase(context: context)
              .call(message: "Sucesso ao inserir a nova foto.");
        } else {
          ShowErrorMessageUsecase(context: context)
              .call(message: "Não foi possível inserir uma nova foto.");
        }
      }
    } catch (e) {
      ShowErrorMessageUsecase(context: context).call(
          message:
              "Não foi possível atualizar a foto de perfil. Tente novamente mais tarde.");
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<bool> getProfilePhoto({required context}) async {
    PermissionStatus permission = await GalleryPermission().call();

    if (permission.isGranted) {
      XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (file != null) {
        final File result = File(file.path);

        image = result;

        return true;
      }

      return false;
    } else {
      ShowErrorMessageUsecase(context: context).call(
          message: "Você precisa permitir que o Marcenaria APP acesse "
              "a galeria do seu dispositivo para incluir uma foto de perfil.");

      return false;
    }
  }

  @action
  Future<bool> getDocumentPhoto({required context}) async {
    try {
      setLoading(true);

      PermissionStatus permission = await GalleryPermission().call();

      if (permission.isGranted) {
        XFile? file =
            await ImagePicker().pickImage(source: ImageSource.gallery);

        if (file != null) {
          final File result = File(file.path);

          workDocument = result;

          return true;
        }

        return false;
      } else {
        ShowErrorMessageUsecase(context: context).call(
            message: "Você precisa permitir que o Marcenaria APP acesse "
                "a galeria do seu dispositivo para incluir a foto do documento.");

        return false;
      }
    } finally {
      setLoading(false);
    }
  }

  @action
  Future<bool> getMarcenariaPhoto({required context}) async {
    try {
      setLoading(true);

      PermissionStatus permission = await GalleryPermission().call();

      if (permission.isGranted) {
        List<XFile> files = await ImagePicker().pickMultipleMedia();

        if (files.isNotEmpty) {
          for (XFile file in files) {
            final File result = File(file.path);

            marcenaria.add(result);

            return true;
          }
        }

        return false;
      } else {
        ShowErrorMessageUsecase(context: context).call(
            message: "Você precisa permitir que o Marcenaria APP acesse "
                "a galeria do seu dispositivo para incluir a foto do documento.");

        return false;
      }
    } finally {
      setLoading(false);
    }
  }

  @action
  init() async {
    ProfileEntity? profile = Modular.get<CoreStore>().profile;
    List<String> value = Modular.get<CoreStore>().jobs;

    pathImage = Modular.get<CoreStore>().pathImage?.split("/").last;

    if (profile != null) {
      name.text = profile.name;
      email.text = profile.email;
      phone.text = profile.phone;
      documentNumber.text = profile.cpf;

      jobs = value.asObservable();
    }
  }

  @action
  update({required context}) async {
    try {
      setLoading(true);

      bool result = await _updateProfileEmployeeUsecase.call(
          userID: Modular.get<CoreStore>().auth?.id ?? 0, dto: profile);

      if (workDocument != null) {
        await _registerUserDocumentUsecase.call(
            employeeID: Modular.get<CoreStore>().profile?.id ?? 0,
            name: path.basename(workDocument!.path),
            photo: workDocument!,
            description: "Foto do Documento");
      }

      if (result) {
        ShowSuccessMessageUsecase(context: context)
            .call(message: "Sucesso ao atualizar os dados de perfil.");

        CoreStore core = Modular.get<CoreStore>();

        core.setProfile(core.profile?.copyWith(
            name: name.text,
            phone: phone.text,
            cpf: documentNumber.text.isEmpty
                ? ""
                : documentNumber.text.replaceAll(".", "").replaceAll("-", ""),
            email: email.text));

        core.setJobs(jobs);
      } else {
        ShowErrorMessageUsecase(context: context)
            .call(message: "Não foi possível atualizar os dados do perfil");
      }
    } catch (e) {
      ShowErrorMessageUsecase(context: context).call(message: e.toString());
    } finally {
      setLoading(false);
    }
  }

  ProfileDTO get profile => ProfileDTO(
      name: name.text,
      email: email.text,
      jobs: jobs,
      cpf: documentNumber.text,
      phone: phone.text);
}
