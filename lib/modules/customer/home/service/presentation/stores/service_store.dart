
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/core/permissions/gallery_permission_utils.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/customer/home/service/domain/dto/service_attachment_dto.dart';
import 'package:marcenaria/modules/customer/home/service/domain/dto/service_dto.dart';
import 'package:marcenaria/modules/customer/home/service/domain/enum/cover_type.dart';
import 'package:marcenaria/modules/customer/home/service/domain/enum/service_attachment_type_enum.dart';
import 'package:marcenaria/modules/customer/home/service/domain/mappers/service_cover_mapper.dart';
import 'package:marcenaria/modules/customer/home/service/domain/usecases/create_service_usecase.dart';
import 'package:marcenaria/modules/customer/home/service/domain/usecases/upload_media_service_usecase.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/utils/service_utils.dart';
import 'package:marcenaria/modules/login/domain/usecases/show_error_message_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';

import '../utils/cover_utils.dart';

part 'service_store.g.dart';

class  ServiceStore = ServiceStoreBase with _$ServiceStore;

abstract class ServiceStoreBase with Store {

  final CreateServiceUseCase _createServiceUseCase = Modular.get<CreateServiceUseCase>();
  final UploadMediaServiceUseCase _uploadMediaServiceUseCase = Modular.get<UploadMediaServiceUseCase>();

  final PageController controller = PageController(initialPage: 0);

  int? customerID = Modular.get<CoreStore>().auth?.id;

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @observable
  int index = 0;

  @action
  setIndex(int value) { index = value; controller.jumpToPage(value); }

  @observable
  String name = "";

  @action
  setName(String value) => name = value;

  @observable
  ObservableList<String> environments = <String>[].asObservable();

  @action
  addEnvironment(String value) => environments.add(value);

  @action
  removeEnvironment(String value) => environments.remove(value);

  @observable
  String observations = "";

  @action
  setObservations(String value) => observations = value;

  @observable
  bool whatsapp = false;

  @action
  setWhatsApp(bool? value) => value != null ? whatsapp = value : null;

  @observable
  int type = 1;

  @action
  setType(int value) => type = value;

  @action
  goToDetailsPage({ required context }) async {

    (String, bool) result = ServiceUtils.validateServiceInformation(service);

    if(result.$2) { setIndex(1); }

    else { ShowErrorMessageUsecase(context: context).call(message: result.$1); }

  }

  @action
  saveService({required context}) async {

    try {

      (String, bool) containsFile = ServiceUtils.validateServiceDetails(serviceFile);


      setLoading(true);

      (String, OrderEntity?) result = await _createServiceUseCase.call(service);

      if(result.$2 == null) { ShowErrorMessageUsecase(context: context).call(message: result.$1); }
      else {

        ServiceAttachmentDTO coverAttachmentDTO = coverDTO(orderID: result.$2?.id ?? 0);
        ServiceAttachmentDTO documentAttachmentDTO = attachmentDTO(orderID: result.$2?.id ?? 0);

        await _uploadMediaServiceUseCase.call(coverAttachmentDTO);
        await _uploadMediaServiceUseCase.call(documentAttachmentDTO);

      }
    } catch(e) { ShowErrorMessageUsecase(context: context).call(message: e.toString()); }
    finally { setLoading(false); }
  }

  @observable
  (String, CoverType)  cover = (ServiceCoverMapper.cover1, CoverType.asset);

  @action
  setCover((String, CoverType) value) => cover = value;

  @observable
  ObservableList<File> coverFiles = <File>[].asObservable();

  @action
  addCoverFile({ required context }) async {

    setLoading(true);

    PermissionStatus permission = await GalleryPermission().call();

    if(permission.isGranted) {

      XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (file != null) {

        final File result = File(file.path);

        coverFiles.add(result);

        setCover((result.path,CoverType.file));
      }

    } else { ShowErrorMessageUsecase(context: context)
        .call(message: "Você precisa permitir que o Marcenaria APP acesse "
        "a galeria do seu dispositivo para incluir novas covers.");
    }

    setLoading(false);

  }

  @observable
  File? serviceFile;

  @action
  addServiceFile({required context}) async {

    setLoading(true);

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {

      File file = File(result.files.single.path!);

      serviceFile = file;
    }

    setLoading(false);
  }

  @computed
  ServiceDTO get service =>
      ServiceDTO(
          customerID: customerID ?? 0,
          name: name,
          environments: environments.isEmpty ? "" : environments.join(", "),
          whatsapp: whatsapp,
          description: observations);


  ServiceAttachmentDTO coverDTO({required int orderID}) =>
      ServiceAttachmentDTO(
          name: CoverUtils.convertNameFile(cover.$1),
          type: ServiceAttachmentType.imagem.name,
          path: "/uploads/covers/",
          customerID: customerID ?? 0,
          orderID: orderID,
          isCover: true,
          description: "cover"
      );

  ServiceAttachmentDTO attachmentDTO({required int orderID}) =>
      ServiceAttachmentDTO(
          name: CoverUtils.convertNameFile(cover.$1),
          type: cover.$1.endsWith("pdf") ? ServiceAttachmentType.pdf.name : ServiceAttachmentType.imagem.name ,
          path: "/uploads/documents/",
          customerID: customerID ?? 0,
          orderID: orderID,
          isCover: false,
          description: "service document"
      );



}