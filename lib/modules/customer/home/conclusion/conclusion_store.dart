import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/modules/admin/domain/entities/employee_user_entity.dart';
import 'package:marcenaria/modules/admin/domain/entities/proposal_entity.dart';
import 'package:marcenaria/modules/customer/home/domain/usecases/rating_order_usecase.dart';
import 'package:marcenaria/modules/login/domain/usecases/show_success_message_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../../admin/domain/entities/order_entity.dart';
import '../../../admin/domain/usecases/get_order_details_without_employee_usecase.dart';
import '../../../login/domain/usecases/show_error_message_usecase.dart';
import '../domain/entities/rating_app_entity.dart';
import '../domain/entities/rating_employee_entity.dart';

part 'conclusion_store.g.dart';

class ConclusionStore = ConclusionStoreBase with _$ConclusionStore;

abstract class ConclusionStoreBase with Store {

  final RatingOrderUsecase _ratingOrderUsecase = Modular.get<RatingOrderUsecase>();
  final _getOrderDetailsWithoutEmployeeUsecase = Modular.get<GetOrderDetailsWithoutEmployeeUsecase>();

  @observable
  OrderEntity? order;

  @observable
  ProposalEntity? proposal;

  @observable
  List<EmployeeUserEntity> employees = <EmployeeUserEntity>[].asObservable();

  @observable
  bool loading = true;

  @action
  setLoading(bool value) => loading = value;

  @observable
  double ratingEmployee = 0;

  @action
  setRatingEmployee(double value) => ratingEmployee = value;

  @observable
  String employeeComment = "";

  @action
  setemployeeComment(String value) => employeeComment = value;

  @observable
  double ratingApp = 0;

  @action
  setRatingApp(double value) => ratingApp = value;

  @observable
  String appComment = "";

  @action
  setappComment(String value) => appComment = value;

  @action
  rating({required context}) async {

    try {

      setLoading(true);

      print(Modular.get<CoreStore>().profile?.id ?? 0);

      (String,bool) result = await _ratingOrderUsecase.call(
          employee: RatingEmployeeEntity(
              customerID: Modular.get<CoreStore>().auth?.id ?? 0,
              orderID: order?.id ?? 0,
              employeeID: employees.first.employeeID,
              comment: employeeComment,
              rating: ratingEmployee.toInt()
          ),
          app:RatingAPPEntity(
              customerID: Modular.get<CoreStore>().auth?.id ?? 0,
              orderID: order?.id ?? 0,
              comment: appComment,
              rating: ratingApp.toInt()
          ));
      if(result.$2) { ShowSuccessMessageUsecase(context: context).call(message: result.$1).whenComplete(() => Modular.to.pop()); }
      else { ShowErrorMessageUsecase(context: context).call(message: result.$1); }
    } catch (e) { ShowErrorMessageUsecase(context: context).call(message: "Não foi possível realizar a avaliação. Tente novamente mais tarde"); }
    finally { setLoading(false); }
  }

  @action
  init({required int orderID}) async {

    setLoading(true);

    (OrderEntity?, ProposalEntity?,List<EmployeeUserEntity>) result = await _getOrderDetailsWithoutEmployeeUsecase.call(orderID: orderID);

    order = result.$1;
    proposal = result.$2;
    employees = result.$3;

    setLoading(false);
  }
}