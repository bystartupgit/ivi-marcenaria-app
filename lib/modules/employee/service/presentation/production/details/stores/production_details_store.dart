import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/employee/service/domain/usecases/finish_service_usecase.dart';
import 'package:marcenaria/modules/login/domain/usecases/show_error_message_usecase.dart';
import 'package:marcenaria/modules/login/domain/usecases/show_success_message_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../admin/domain/entities/order_entity.dart';
import '../../../../../../admin/domain/entities/proposal_entity.dart';
import '../../../../../../admin/domain/usecases/get_order_details_without_employee_usecase.dart';

part 'production_details_store.g.dart';

class ProductionDetailsStore = ProductionDetailsStoreBase with _$ProductionDetailsStore;

abstract class ProductionDetailsStoreBase with Store {

  final _finishServiceUseCase = Modular.get<FinishServiceUsecase>();
  final _getOrderDetailsWithoutEmployeeUsecase = Modular.get<GetOrderDetailsWithoutEmployeeUsecase>();

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

    setLoading(true);

    (OrderEntity?, ProposalEntity?) result = await _getOrderDetailsWithoutEmployeeUsecase.call(orderID: orderID);

    order = result.$1;
    proposal = result.$2;

    setLoading(false);
  }

  @action
  finishService({required context}) async {

    try {

      setLoading(true);

      (String,bool) result = await _finishServiceUseCase.call(proposalID: proposal?.idProposta ?? 0);

      if(result.$2) { ShowSuccessMessageUsecase(context: context).call(message: result.$1).then((e) => Modular.to.pop(true)); }
      else { ShowErrorMessageUsecase(context: context).call(message: result.$1); }

    } catch(e){ ShowErrorMessageUsecase(context: context).call(message: "Erro ao finalizar o serviço"); } finally{ setLoading(false); }

  }
}