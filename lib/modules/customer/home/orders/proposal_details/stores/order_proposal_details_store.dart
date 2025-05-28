import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/proposal_entity.dart';
import 'package:marcenaria/modules/customer/home/orders/presentation/stores/order_store.dart';
import 'package:mobx/mobx.dart';
import 'package:open_file/open_file.dart';

import '../../../../../login/domain/usecases/show_error_message_usecase.dart';
import '../../domain/entities/media_entity.dart';
import '../../domain/usecases/cancel_order_usecase.dart';
import '../../domain/usecases/download_media_usecase.dart';
import '../../domain/usecases/get_order_details_usecase.dart';

part 'order_proposal_details_store.g.dart';

class OrderProposalDetailsStore = OrderProposalDetailsStoreBase
    with _$OrderProposalDetailsStore;

abstract class OrderProposalDetailsStoreBase with Store {
  final DownloadMediaUsecase _downloadMediaUsecase =
      Modular.get<DownloadMediaUsecase>();
  final GetOrderDetailsUsecase _getOrderDetailsUsecase =
      Modular.get<GetOrderDetailsUsecase>();
  final CancelOrderUsecase _cancelOrderUsecase =
      Modular.get<CancelOrderUsecase>();

  @observable
  bool showMore = false;

  @observable
  bool loading = false;

  @action
  setLoading(bool value) => loading = value;

  @action
  setShowMore() => showMore = !showMore;

  @observable
  MediaEntity? media;

  @observable
  File? file;

  @action
  init({required int orderID}) async {
    try {
      setLoading(true);

      media = await _getOrderDetailsUsecase.call(orderID: orderID);
      file = await _downloadMediaUsecase.call(
          name: media!.name, path: media!.path);
    } catch (e) {
      print(e);
    } finally {
      (setLoading(false));
    }
  }

  String formatValues(double value) =>
      NumberFormat.currency(locale: "pt_BR", symbol: "", decimalDigits: 2)
          .format(value)
          .trim();

  @action
  downloadMedia() async {
    try {
      setLoading(true);

      if (file != null) {
        await OpenFile.open(file!.path);
      }
    } catch (e) {
      print(e);
    } finally {
      (setLoading(false));
    }
  }

  @action
  cancelOrder({required ProposalEntity order, required context}) async {
    try {
      setLoading(true);

      bool result = await _cancelOrderUsecase.call(orderID: order.idPedido);

      if (result) {
        Modular.get<OrderStore>().removeProposalOrders(order.idProposta);
        Modular.to.pop();
      } else {
        ShowErrorMessageUsecase(context: context)
            .call(message: "Não foi possível cancelar a proposta");
      }
    } catch (e) {
      ShowErrorMessageUsecase(context: context).call(
          message:
              "Não foi possível cancelar a proposta. Tente novamente mais tarde");
    } finally {
      setLoading(false);
    }
  }
}
