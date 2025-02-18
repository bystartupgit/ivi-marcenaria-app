

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_without_proposal_entity.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_order_without_proposal_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../domain/dtos/create_proporsal_dto.dart';
import '../../../../domain/usecases/create_proposal_usecase.dart';

part 'create_proposal_store.g.dart';

class CreateProposalStore = CreateProposalStoreBase with _$CreateProposalStore;

abstract class CreateProposalStoreBase with Store {

  final CreateProposalUsecase _createProposalUsecase = Modular.get<CreateProposalUsecase>();
  final GetOrderWithoutProposalUsecase _getOrderDetailsUsecase = Modular.get<GetOrderWithoutProposalUsecase>();

  @observable
  OrderWithoutProposalEntity? order;

  @observable
  bool moreDetails = true;

  @action
  changeMoreDetails() => moreDetails = !moreDetails;

  @observable
  bool loading = true;

  @observable
  bool showMore = false;

  @action
  setShowMore() => showMore = !showMore;

  @action
  setLoading(bool value) => loading = value;

  @action
  init({required int orderID}) async {

    setLoading(true);

    order = await _getOrderDetailsUsecase.call(orderID: orderID);

    setLoading(false);

  }


  @observable
  String environments = "";

  @action
  setEnvironments(String value) => environments = value;

  @observable
  String total = "";

  @action
  setTotal(String value) => total = value;

  @observable
  String opening = "";

  @action
  setOpening(String value) => opening = value;

  @observable
  String numberParcels = "";

  @action
  setNumberParcels(String value) => numberParcels = value;

  @observable
  String valueParcel = "";

  @action
  setValueParcel(String value) => valueParcel = value;

  @observable
  bool forTo = false;

  @action
  setForTo(bool? value) => forTo = value ?? false;

  @observable
  String forToValue = "";

  @action
  setForToValue(String value) => forToValue = value;

  @observable
  String valuePix = "";

  @action
  setValuePix(String value) => valuePix = value;

  @observable
  String discount = "";

  @action
  setDiscount(String value) => discount = value;

  @observable
  String temporal = "Não";

  @action
  setTemporal(String? value) => temporal = value ?? "Não";

  @observable
  String dateLimit = "30 dias uteis";

  @observable
  File? proporsalFile;

  @action
  getFile() async {

    setLoading(true);

    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowMultiple: false,
        allowedExtensions: ['png', 'pdf']);

    if (result != null) {

      XFile file = result.xFiles.first;

      proporsalFile = File(file.path);
    }

    setLoading(false);
  }

  @action
  setDateLimit(String? value) => dateLimit = value ?? "30 dias uteis";

  String formatValues(double value) => NumberFormat.currency(locale: "pt_BR", symbol: "",decimalDigits: 2).format(value).trim();

  CreateProposalDTO dto() =>
      CreateProposalDTO(
          orderID: order?.id ?? 0,
          message: environments,
          valueParcel: total.isEmpty ? null : double.parse(total.replaceAll(",", "").replaceAll(".", "")),
          totalValue: total.isEmpty ? 0.0 : double.parse(total.replaceAll(",", "").replaceAll(".", "")),
          pixValue: valuePix.isEmpty ? 0.0 : double.parse(valuePix.replaceAll(",", "").replaceAll(".", "")),
          discountValue: discount.isEmpty ? 0.0 : double.parse(discount.replaceAll(",", "").replaceAll(".", "").replaceAll("%", "")),
          openingValue: opening.isEmpty ? null : double.parse(opening.replaceAll(",", "").replaceAll(".", "")),
          parcels: numberParcels.isEmpty ? null : int.parse(numberParcels),
          temporal: temporal == "Não" ? false : true,
          fromTo: forToValue.isEmpty ? null : double.parse(forToValue.replaceAll(",", "").replaceAll(".", "")),
          url: "");



}