import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marcenaria/core/environments/app_environments.dart';
import 'package:marcenaria/modules/admin/domain/entities/customer_quantity_entity.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_finished_orders_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_production_orders_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_waiting_approval_orders_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_waiting_orders_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:path/path.dart' as path;
import 'package:permission_handler/permission_handler.dart';

import '../../../../../../core/permissions/gallery_permission_utils.dart';
import '../../../../../customer/home/profile/domain/dtos/profile_dto.dart';
import '../../../../../customer/home/profile/domain/usecases/upload_profile_photo_usecase.dart';
import '../../../../../login/domain/usecases/show_error_message_usecase.dart';
import '../../../../../login/domain/usecases/show_success_message_usecase.dart';
import '../../../../domain/entities/customer_user_entity.dart';
import '../../../../domain/entities/order_entity.dart';
import '../../../../domain/usecases/get_customers_quantity_orders_usecase.dart';

part 'profile_store.g.dart';

class ProfileStore = ProfileStoreBase with _$ProfileStore;

abstract class ProfileStoreBase with Store {
  final GetWaitingOrdersUsecase _getWaitingOrdersUsecase =
      Modular.get<GetWaitingOrdersUsecase>();
  final GetWaitingApprovalOrdersUsecase _getWaitingApprovalOrdersUsecase =
      Modular.get<GetWaitingApprovalOrdersUsecase>();
  final GetProductionOrdersUsecase _getProductionOrdersUsecase =
      Modular.get<GetProductionOrdersUsecase>();
  final GetFinishedOrdersUsecase _getFinishedOrdersUsecase =
      Modular.get<GetFinishedOrdersUsecase>();
  final GetCustomersQuantityOrdersUsecase _getCustomersQuantityOrdersUsecase =
      Modular.get<GetCustomersQuantityOrdersUsecase>();
  final UploadProfilePhotoUsecase _uploadProfilePhotoUsecase =
      Modular.get<UploadProfilePhotoUsecase>();

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController documentNumber = TextEditingController();

  @observable
  CustomerQuantityEntity quantity = CustomerQuantityEntity();

  @observable
  ObservableList<OrderEntity> orders = <OrderEntity>[].asObservable();

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
  init({required CustomerUserEntity customer}) async {
    setLoading(true);

    quantity = await _getCustomersQuantityOrdersUsecase.call(
        customerID: customer.customerID);

    List<OrderEntity> result = <OrderEntity>[];

    result = await _getWaitingOrdersUsecase.call(
        customerID: customer.customerID, page: 1, limit: 100);

    orders.addAll(result);

    _getWaitingApprovalOrdersUsecase.call(
        customerID: customer.customerID, page: 1, limit: 100);
    _getProductionOrdersUsecase.call(
        customerID: customer.customerID, page: 1, limit: 100);

    result = await _getFinishedOrdersUsecase.call(
        customerID: customer.customerID, page: 1, limit: 100);

    orders.addAll(result);

    name.text = customer.name;
    email.text = customer.email;
    phone.text = customer.phone;
    documentNumber.text = customer.cpf;
    pathImage = customer.image?.split("/").last.toString();

    setLoading(false);
  }

  @action
  uploadImage({required context, required CustomerUserEntity customer}) async {
    try {
      setLoading(true);

      bool result = await getProfilePhoto(context: context);

      if (result) {
        int customerID = customer.customerID;

        bool result = await _uploadProfilePhotoUsecase.call(
            customerID: customerID,
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
  update(ProfileDTO dto) {
    name.text = dto.name;
    email.text = dto.email;
    phone.text = dto.phone;
    documentNumber.text = dto.cpf;

    pathImage = dto.image;
  }
}
