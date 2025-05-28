import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/employee/orders/domain/usecases/get_order_details_usecase.dart';
import 'package:marcenaria/modules/employee/orders/domain/usecases/start_service_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../../../core/data/store/core_store.dart';
import '../../../../../../../admin/domain/entities/order_entity.dart';
import '../../../../../../../admin/domain/entities/proposal_entity.dart';
import '../../../../../../../login/domain/usecases/show_error_message_usecase.dart';
import '../../../../../domain/usecases/decline_proposal_usecase.dart';

part 'order_peding_details_store.g.dart';

class OrderPedingDetailsStore = OrderPedingDetailsStoreBase
    with _$OrderPedingDetailsStore;

abstract class OrderPedingDetailsStoreBase with Store {
  final StartServiceUsecase _startServiceUsecase =
      Modular.get<StartServiceUsecase>();
  final DeclineProposalUsecase _declineProposalUsecase =
      Modular.get<DeclineProposalUsecase>();
  final GetOrderDetailsUsecase _getOrderDetailsUsecase =
      Modular.get<GetOrderDetailsUsecase>();

  @observable
  OrderEntity? order;

  @observable
  ProposalEntity? proposal;

  @observable
  bool loading = true;

  @action
  setLoading(bool value) => loading = value;

  @action
  cancelProposal({required context}) async {
    try {
      setLoading(true);

      bool result = await _declineProposalUsecase.call(
          proposalID: proposal?.idProposta ?? 0,
          employeeID: Modular.get<CoreStore>().profile?.id ?? 0);

      if (result) {
        Modular.to.pop(true);
      } else {
        ShowErrorMessageUsecase(context: context).call(
            message:
                "Não foi possível rejeitar a proposta. Tente novamente mais tarde");
      }
    } catch (e) {
      ShowErrorMessageUsecase(context: context)
          .call(message: "Erro ao tentar rejeitar a proposta.");
    } finally {
      setLoading(false);
    }
  }

  @action
  startService({required context}) async {
    try {
      setLoading(true);

      bool result = await _startServiceUsecase.call(
          proposalID: proposal?.idProposta ?? 0);

      if (result) {
        Modular.to.pop(true);
      } else {
        ShowErrorMessageUsecase(context: context).call(
            message:
                "Não foi possível iniciar o serviço. Tente novamente mais tarde");
      }
    } catch (e) {
      ShowErrorMessageUsecase(context: context)
          .call(message: "Erro ao tentar iniciar o serviço.");
    } finally {
      setLoading(false);
    }
  }

  @action
  init({required int orderID}) async {
    try {
      setLoading(true);

      (OrderEntity?, ProposalEntity?) result =
          await _getOrderDetailsUsecase.call(orderID: orderID);

      order = result.$1;
      proposal = result.$2;
    } finally {
      setLoading(false);
    }
  }
}
