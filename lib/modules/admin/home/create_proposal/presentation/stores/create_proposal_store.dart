

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_without_proposal_entity.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_order_without_proposal_usecase.dart';
import 'package:marcenaria/modules/login/domain/usecases/show_error_message_usecase.dart';
import 'package:mobx/mobx.dart';
import 'package:open_file/open_file.dart';

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
  bool loadingScreen = false;

  @action
  setLoadingScreen(bool value) => loadingScreen = value;

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
  setTotal(String value) { total = value; }

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

    setLoadingScreen(true);

    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowMultiple: false,
        allowedExtensions: ['png', 'pdf']);

    if (result != null) {

      XFile file = result.xFiles.first;

      proporsalFile = File(file.path);
    }

    setLoadingScreen(false);
  }

  @action
  setDateLimit(String? value) => dateLimit = value ?? "30 dias uteis";

  String formatValues(double value) => NumberFormat.currency(locale: "pt_BR", symbol: "",decimalDigits: 2).format(value).trim();

  CreateProposalDTO dto({String? url}) {

    NumberFormat format = NumberFormat.simpleCurrency(locale: 'pt_BR');

    CreateProposalDTO value = CreateProposalDTO(
        orderID: order?.id ?? 0,
        message: environments,
        valueParcel:  valueParcel.isEmpty ? null : format.parse(valueParcel) as double,
        totalValue: total.isEmpty ? 0.0 : format.parse(total) as double,
        pixValue: valuePix.isEmpty ? 0.0 : format.parse(valuePix) as double,
        discountValue: discount.isEmpty ? 0.0 : format.parse(discount.replaceAll("%", "")) as double,
        openingValue: opening.isEmpty ? null :format.parse(opening) as double,
        parcels: numberParcels.isEmpty ? null : int.parse(numberParcels),
        temporal: temporal == "Não" ? false : true,
        fromTo: forTo == false && forToValue.isEmpty ? null : format.parse(forToValue) as double,
        url: url);

    return value;
  }

  @action
  download() async {

    try{

      setLoadingScreen(true);

      if(proporsalFile != null) {
        await OpenFile.open(proporsalFile!.path);
      }

    } catch(e) { print(e); } finally { (setLoadingScreen(false)); }

  }

  @action
  createProporsal({required context}) async {

    try{

      Navigator.pop(context);
      setLoadingScreen(true);

      (String,bool) result = await _createProposalUsecase.call(dto: dto());
      
      if(result.$2) { Modular.to.pop(true);}
      else { ShowErrorMessageUsecase(context: context).call(message: result.$1); }


    }catch(e) {} finally{ setLoadingScreen(false); }


  }



}