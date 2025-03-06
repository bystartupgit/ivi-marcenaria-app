import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/modules/admin/domain/entities/proposal_entity.dart';
import 'package:marcenaria/modules/employee/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/employee/orders/domain/usecases/accept_proposal_usecase.dart';
import 'package:marcenaria/modules/employee/orders/domain/usecases/get_order_details_usecase.dart';
import 'package:marcenaria/modules/login/domain/usecases/show_error_message_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../../admin/domain/entities/order_entity.dart';
import '../../../../../domain/usecases/decline_proposal_usecase.dart';


part 'waiting_interesting_details_store.g.dart';

class WaitingInterestingDetailsStore = WaitingInterestingDetailsStoreBase with _$WaitingInterestingDetailsStore;

abstract class WaitingInterestingDetailsStoreBase with Store {

  final AcceptProposalUsecase _acceptProposalUsecase = Modular.get<AcceptProposalUsecase>();
  final DeclineProposalUsecase _declineProposalUsecase = Modular.get<DeclineProposalUsecase>();
  final GetOrderDetailsUsecase _getOrderDetailsUsecase = Modular.get<GetOrderDetailsUsecase>();

  @observable
  OrderEntity? order;

  @observable
  ProposalEntity? proposal;

  @observable
  bool loading = true;

  @action
  setLoading(bool value) => loading = value;

  @action
  init({required int orderID}) async {

    try {

      setLoading(true);

      (OrderEntity?, ProposalEntity?) result = await _getOrderDetailsUsecase.call(orderID: orderID);

      order = result.$1;
      proposal = result.$2;


    }finally { setLoading(false); }
  }

  @action
  cancelProposal({required context}) async {

    try {

      setLoading(true);

      bool result = await _declineProposalUsecase.call(
          proposalID: proposal?.idProposta ?? 0,
          employeeID: Modular.get<CoreStore>().profile?.id ?? 0);

      if(result) { Modular.to.pop(true); }
      else { ShowErrorMessageUsecase(context: context).call(message: "Não foi possível rejeitar a proposta. Tente novamente mais tarde"); }

    } catch(e) { ShowErrorMessageUsecase(context: context).call(message: "Erro ao tentar rejeitar a proposta.");  } finally { setLoading(false); }
  }

  @action
  approvalProposal({required context}) async {

    try {

      setLoading(true);

      bool result = await _acceptProposalUsecase.call(
          proposalID: proposal?.idProposta ?? 0,
          employeeID: Modular.get<CoreStore>().profile?.id ?? 0);

      if(result) { Modular.to.pushNamed(RouterMapper.orderWaitingSuccessDetailsIntern); }
      else { ShowErrorMessageUsecase(context: context).call(message: "Não foi possível aceitar a proposta. Tente novamente mais tarde"); }

    } catch(e) { ShowErrorMessageUsecase(context: context).call(message: "Erro ao tentar aceitar a proposta.");  } finally { setLoading(false); }
  }
}