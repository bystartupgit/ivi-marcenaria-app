import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/chat_support/chat_module.dart';
import 'package:marcenaria/modules/admin/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/admin/domain/usecases/create_proposal_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_all_conclusion_orders_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_all_production_orders_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_customers_quantity_orders_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_employees_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_finished_orders_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_order_conversation_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_order_without_proposal_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_production_orders_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_user_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_waiting_approval_orders_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_waiting_employees_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_waiting_orders_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/get_waiting_proposal_usecase.dart';
import 'package:marcenaria/modules/admin/domain/usecases/register_fcm_token_usecase.dart';
import 'package:marcenaria/modules/admin/external/conversation_datasource.dart';
import 'package:marcenaria/modules/admin/external/order_datasource.dart';
import 'package:marcenaria/modules/admin/external/proposal_datasource.dart';
import 'package:marcenaria/modules/admin/external/role_datasource.dart';
import 'package:marcenaria/modules/admin/external/user_datasource.dart';
import 'package:marcenaria/modules/admin/home/conclusion/details/conclusion_details_page.dart';
import 'package:marcenaria/modules/admin/home/conclusion/store/conclusion_store.dart';
import 'package:marcenaria/modules/admin/home/conversations/conversations_store.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/create_proposal_page.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/stores/create_proposal_store.dart';
import 'package:marcenaria/modules/admin/home/customers/customer_page.dart';
import 'package:marcenaria/modules/admin/home/customers/profile/form/profile_form_page.dart';
import 'package:marcenaria/modules/admin/home/customers/profile/form/store/profile_form_store.dart';
import 'package:marcenaria/modules/admin/home/customers/profile/profile_page.dart';
import 'package:marcenaria/modules/admin/home/customers/profile/stores/profile_store.dart';
import 'package:marcenaria/modules/admin/home/customers/register/customer_register_page.dart';
import 'package:marcenaria/modules/admin/home/customers/register/stores/customer_register_store.dart';
import 'package:marcenaria/modules/admin/home/customers/stores/customer_store.dart';
import 'package:marcenaria/modules/admin/home/orders/choice_employee/details/choice_employee_details_page.dart';
import 'package:marcenaria/modules/admin/home/orders/choice_employee/details/select_employee/stores/select_employee_store.dart';
import 'package:marcenaria/modules/admin/home/orders/production/details/production_details_page.dart';
import 'package:marcenaria/modules/admin/home/orders/production/details/store/production_details_store.dart';
import 'package:marcenaria/modules/admin/home/orders/production/stores/production_store.dart';
import 'package:marcenaria/modules/admin/home/orders/stores/order_store.dart';
import 'package:marcenaria/modules/admin/home/orders/waiting_employee/details/potential_employee/stores/potential_employee_store.dart';
import 'package:marcenaria/modules/admin/home/orders/waiting_employee/stores/waiting_employee_store.dart';
import 'package:marcenaria/modules/admin/home/payment/payment_page.dart';
import 'package:marcenaria/modules/admin/home/payment/stores/payment_store.dart';
import 'package:marcenaria/modules/admin/home/proposal/presentation/stores/proposal_store.dart';
import 'package:marcenaria/modules/customer/home/profile/external/profile_datasource.dart';
import 'package:marcenaria/modules/employee/service/external/service_datasource.dart';
import 'package:marcenaria/modules/login/external/login_datasource.dart';

import '../customer/home/profile/domain/usecases/update_profile_usecase.dart';
import '../customer/home/profile/domain/usecases/upload_profile_photo_usecase.dart';
import '../employee/service/domain/usecases/finish_service_usecase.dart';
import '../login/domain/usecases/register_usecase.dart';
import 'domain/usecases/get_customers_usecase.dart';
import 'domain/usecases/get_employee_selection_for_job_usecase.dart';
import 'domain/usecases/get_employees_with_potential_usecase.dart';
import 'domain/usecases/get_order_details_without_employee_usecase.dart';
import 'domain/usecases/get_order_waiting_proposal_usecase.dart';
import 'domain/usecases/get_waiting_choice_employees_usecase.dart';
import 'domain/usecases/save_employee_proposal_usecase.dart';
import 'domain/usecases/save_potential_employee_usecase.dart';
import 'home/conclusion/details/stores/conclusion_details_store.dart';
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
    i.addSingleton(() => ConclusionStore());
    i.add(() => PaymentStore());
    i.add(() => CreateProposalStore());
    i.add(() => CustomerRegisterStore());
    i.add(() => ProfileStore());

    i.addSingleton(() => OrderStore());
    i.add(() => ChoiceEmployeeStore());
    i.add(() => ChoiceEmployeeDetailsStore());
    i.add(() => SelectEmployeeStore());

    i.add(() => WaitingEmployeeStore());
    i.add(() => WaitingEmployeeDetailsStore());
    i.add(() => PotentialEmployeeStore());
    i.add(() => ProductionStore());
    i.add(() => ProductionDetailsStore());
    i.add(() => ConclusionDetailsStore());
    i.add(() => CustomerStore());
    i.add(() => ProfileFormStore());
    i.add(() => ConversationStore());

    i.add(() => OrderDataSource());
    i.add(() => ProposalDataSource());
    i.add(() => UserDataSource());
    i.add(() => ProfileDatasource());
    i.add(() => ServiceDataSource());
    i.add(() => RoleDataSource());
    i.add(() => ConversationDataSource());

    i.add(() =>
        GetOrderWithoutProposalUsecase(datasource: i.get<OrderDataSource>()));
    i.add(
        () => GetWaitingProposalUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => GetUserUseCase(datasource: i.get<UserDataSource>()));
    i.add(() => CreateProposalUsecase(datasource: i.get<ProposalDataSource>()));
    i.add(() =>
        GetOrderWaitingAppovalUsecase(datasource: i.get<OrderDataSource>()));
    i.add(
        () => GetWaitingEmployeesUsecase(datasource: i.get<OrderDataSource>()));

    i.add(() =>
        GetWaitingChoiceEmployeesUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => GetOrderDetailsWithoutEmployeeUsecase(
        datasource: i.get<OrderDataSource>()));
    i.add(() =>
        GetAllProductionOrdersUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() =>
        GetAllConclusionOrdersUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => FinishServiceUsecase(datasource: i.get<ServiceDataSource>()));

    i.add(() => GetEmployeesUsecase(datasource: i.get<RoleDataSource>()));
    i.add(() =>
        GetEmployeesWithPotentialUseCase(datasource: i.get<OrderDataSource>()));
    i.add(() =>
        SavePotentialEmployeeUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => GetEmployeeSelectionForJobUsecase(
        datasource: i.get<OrderDataSource>()));
    i.add(() =>
        SaveEmployeeProposalUseCase(datasource: i.get<ProposalDataSource>()));
    i.add(() => RegisterFcmTokenUsecase(datasource: i.get<UserDataSource>()));

    i.add(() => GetCustomersUsecase(datasource: i.get<UserDataSource>()));
    i.add(() => RegisterUseCase(datasource: LoginDataSource()));
    i.add(() =>
        UploadProfilePhotoUsecase(datasource: i.get<ProfileDatasource>()));
    i.add(() => UpdateProfileUsecase(datasource: i.get<ProfileDatasource>()));
    i.add(() =>
        GetCustomersQuantityOrdersUsecase(datasource: i.get<UserDataSource>()));
    i.add(() => GetWaitingOrdersUsecase(datasource: i.get<UserDataSource>()));
    i.add(() =>
        GetWaitingApprovalOrdersUsecase(datasource: i.get<UserDataSource>()));
    i.add(
        () => GetProductionOrdersUsecase(datasource: i.get<UserDataSource>()));
    i.add(() => GetFinishedOrdersUsecase(datasource: i.get<UserDataSource>()));

    i.add(() => GetPrivateConversationUsecase(datasource: i.get()));
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const NavigationPage());
    r.child(RouterMapper.createProposal,
        child: (context) => CreateProposalPage(orderID: r.args.data));
    r.child(RouterMapper.paymentProposal,
        child: (context) => PaymentPage(orderID: r.args.data));

    r.child(RouterMapper.choiceEmployeeDetails,
        child: (context) => ChoiceEmployeeDetailsPage(orderID: r.args.data));
    r.child(RouterMapper.waitingEmployeeDetails,
        child: (context) => WaitingEmployeeDetailsPage(orderID: r.args.data));
    r.child(RouterMapper.productionOrderDetails,
        child: (context) => ProductionDetailsPage(orderID: r.args.data));
    r.child(RouterMapper.conclusionOrderDetails,
        child: (context) => ConclusionDetailsPage(orderID: r.args.data));

    r.child(RouterMapper.customer, child: (context) => const CustomerPage());
    r.child(RouterMapper.customerRegister,
        child: (context) => const CustomerRegisterPage());
    r.child(RouterMapper.customerProfile,
        child: (context) => ProfilePage(profile: r.args.data));
    r.child(RouterMapper.customerProfileForm,
        child: (context) => ProfileFormPage(profile: r.args.data));

    r.module("/admin-suport/", module: ChatSuportModule());
  }
}
