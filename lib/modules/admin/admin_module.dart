import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/admin/domain/usecases/create_proposal_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_declined_order_employees_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_employees_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_order_without_proposal_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_user_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_waiting_employees_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_waiting_proposal_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/register_fcm_token_usecase.dart';
import 'package:marcenaria/modules/admin/external/order_datasource.dart';
import 'package:marcenaria/modules/admin/external/proposal_datasource.dart';
import 'package:marcenaria/modules/admin/external/role_datasource.dart';
import 'package:marcenaria/modules/admin/external/user_datasource.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/create_proposal_page.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/stores/create_proposal_store.dart';
import 'package:marcenaria/modules/admin/home/orders/choice_employee/details/choice_employee_details_page.dart';
import 'package:marcenaria/modules/admin/home/orders/choice_employee/details/select_employee/stores/select_employee_store.dart';
import 'package:marcenaria/modules/admin/home/orders/stores/order_store.dart';
import 'package:marcenaria/modules/admin/home/orders/waiting_employee/details/potential_employee/stores/potential_employee_store.dart';
import 'package:marcenaria/modules/admin/home/orders/waiting_employee/stores/waiting_employee_store.dart';
import 'package:marcenaria/modules/admin/home/payment/payment_page.dart';
import 'package:marcenaria/modules/admin/home/payment/stores/payment_store.dart';
import 'package:marcenaria/modules/admin/home/proposal/presentation/stores/proposal_store.dart';

import 'domain/usecases/get_employee_selection_for_job_usecase.dart';
import 'domain/usecases/get_employees_with_potential_usecase.dart';
import 'domain/usecases/get_order_details_without_employee_usecase.dart';
import 'domain/usecases/get_order_waiting_proposal_usecase.dart';
import 'domain/usecases/get_waiting_choice_employees_usecase.dart';
import 'domain/usecases/save_employee_proposal_usecase.dart';
import 'domain/usecases/save_potential_employee_usecase.dart';
import 'home/orders/choice_employee/details/stores/choice_employee_details_store.dart';
import 'home/orders/choice_employee/store/choice_employee_store.dart';
import 'home/orders/waiting_employee/details/stores/waiting_employee_details_store.dart';
import 'home/orders/waiting_employee/details/waiting_employee_details_page.dart';
import 'navigation/navigation_page.dart';
import 'navigation/stores/navigation_store.dart';

class AdminModule extends Module {

  @override
  void binds(i) {
    i.addSingleton(() => NavigationStore());
    i.addSingleton(() => ProposalStore());
    i.add(() => PaymentStore());
    i.add(() => CreateProposalStore());


    i.addSingleton(() => OrderStore());
    i.add(() => ChoiceEmployeeStore());
    i.add(() => ChoiceEmployeeDetailsStore());
    i.add(() => SelectEmployeeStore());

    i.add(() => WaitingEmployeeStore());
    i.add(() => WaitingEmployeeDetailsStore());
    i.add(() => PotentialEmployeeStore());


    i.add(() => OrderDataSource());
    i.add(() => ProposalDataSource());
    i.add(() => UserDataSource());
    i.add(() => RoleDataSource());

    i.add(() => GetOrderWithoutProposalUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => GetWaitingProposalUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => GetUserUseCase(datasource: i.get<UserDataSource>()));
    i.add(() => CreateProposalUsecase(datasource: i.get<ProposalDataSource>()));
    i.add(() => GetOrderWaitingAppovalUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => GetWaitingEmployeesUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => GetDeclinedOrderEmployeesUsecase(datasource: i.get<OrderDataSource>()));

    i.add(() => GetWaitingChoiceEmployeesUsecase(datasource:i.get<OrderDataSource>()));
    i.add(() => GetOrderDetailsWithoutEmployeeUsecase(datasource:i.get<OrderDataSource>()));

    i.add(() => GetEmployeesUsecase(datasource: i.get<RoleDataSource>()));
    i.add(() => GetEmployeesWithPotentialUseCase(datasource: i.get<OrderDataSource>()));
    i.add(() => SavePotentialEmployeeUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => GetEmployeeSelectionForJobUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => SaveEmployeeProposalUseCase(datasource: i.get<ProposalDataSource>()));
    i.add(() => RegisterFcmTokenUsecase(datasource: i.get<UserDataSource>()));

  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const NavigationPage());
    r.child(RouterMapper.createProposal, child: (context) => CreateProposalPage(orderID: r.args.data));
    r.child(RouterMapper.paymentProposal, child: (context) => PaymentPage(orderID: r.args.data));
    
    r.child(RouterMapper.choiceEmployeeDetails, child:  (context) => ChoiceEmployeeDetailsPage(orderID: r.args.data));
    r.child(RouterMapper.waitingEmployeeDetails, child:  (context) => WaitingEmployeeDetailsPage(orderID: r.args.data));
  }
}