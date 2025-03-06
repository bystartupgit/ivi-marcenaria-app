import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/customer/data/routers/customer_routers.dart';
import 'package:marcenaria/modules/customer/home/conversations/presentation/stores/conversation_store.dart';
import 'package:marcenaria/modules/customer/home/domain/usecases/get_user_usecase.dart';
import 'package:marcenaria/modules/customer/home/domain/usecases/register_fcm_token_usecase.dart';
import 'package:marcenaria/modules/customer/home/external/user_datasource.dart';
import 'package:marcenaria/modules/customer/home/orders/details/presentation/order_waiting_details_page.dart';
import 'package:marcenaria/modules/customer/home/orders/details/presentation/stores/order_waiting_details_store.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/usecases/cancel_order_usecase.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/usecases/confirm_payment_usecase.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/usecases/download_media_usecase.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/usecases/get_order_details_usecase.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/usecases/get_waiting_approval_orders_usecase.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/usecases/get_waiting_orders_usecase.dart';
import 'package:marcenaria/modules/customer/home/orders/external/order_datasource.dart';
import 'package:marcenaria/modules/customer/home/orders/external/payment_datasource.dart';
import 'package:marcenaria/modules/customer/home/orders/payment/components/payment_success_page.dart';
import 'package:marcenaria/modules/customer/home/orders/payment/payment_page.dart';
import 'package:marcenaria/modules/customer/home/orders/payment/stores/payment_store.dart';
import 'package:marcenaria/modules/customer/home/orders/presentation/stores/order_store.dart';
import 'package:marcenaria/modules/customer/home/presentation/stores/home_store.dart';
import 'package:marcenaria/modules/customer/home/profile/domain/usecases/update_profile_usecase.dart';
import 'package:marcenaria/modules/customer/home/profile/external/profile_datasource.dart';
import 'package:marcenaria/modules/customer/home/profile/form/presentation/profile_form_page.dart';
import 'package:marcenaria/modules/customer/home/profile/form/presentation/stores/profile_form_store.dart';
import 'package:marcenaria/modules/customer/home/profile/presentation/profile_page.dart';
import 'package:marcenaria/modules/customer/home/profile/presentation/stores/profile_store.dart';
import 'package:marcenaria/modules/customer/home/proposal/domain/usecases/get_finished_orders_usecase.dart';
import 'package:marcenaria/modules/customer/home/proposal/domain/usecases/get_production_orders_usecase.dart';
import 'package:marcenaria/modules/customer/home/proposal/external/proposal_datasource.dart';
import 'package:marcenaria/modules/customer/home/proposal/presentation/order_production/order_production_page.dart';
import 'package:marcenaria/modules/customer/home/proposal/presentation/stores/proposal_store.dart';
import 'package:marcenaria/modules/customer/home/service/domain/usecases/create_service_usecase.dart';
import 'package:marcenaria/modules/customer/home/service/domain/usecases/get_services_usecase.dart';
import 'package:marcenaria/modules/customer/home/service/domain/usecases/upload_media_service_usecase.dart';
import 'package:marcenaria/modules/customer/home/service/external/service_datasource.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/service_page.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/stores/service_store.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/success/service_succes_page.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/success/stores/service_success_store.dart';
import 'package:marcenaria/modules/customer/navigation/presentation/stores/navigation_store.dart';

import '../admin/domain/usecases/get_order_details_without_employee_usecase.dart';
import 'home/orders/domain/usecases/aprove_proposal_usecase.dart';
import 'home/orders/proposal_details/proposal_details_page.dart';
import 'home/orders/proposal_details/stores/order_proposal_details_store.dart';
import 'home/profile/domain/usecases/upload_profile_photo_usecase.dart';
import 'home/proposal/presentation/order_production/stores/order_production_store.dart';
import 'navigation/presentation/navigation_page.dart';

class CustomerModule extends Module {

  @override
  void binds(i) {
    i.addSingleton(() => NavigationStore());
    i.add(() => HomeStore());
    i.add(() => ServiceStore());
    i.addSingleton(() => OrderStore());
    i.add(() => ConversationStore());
    i.add(() => ProfileStore());
    i.add(() => ProfileFormStore());
    i.addSingleton(() => ProposalStore());
    i.add(() => ServiceSuccessStore());
    i.add(() => OrderProductionStore());

    i.add(() => OrderWaitingDetailsStore());
    i.add(() => OrderProposalDetailsStore());
    i.add(() => PaymentStore());

    i.add(() => ServiceDataSource());
    i.add(() => UserDataSource());
    i.add(() => OrderDataSource());
    i.add(() => ProfileDatasource());
    i.add(() => ProposalDataSource());
    i.add(() => PaymentDataSource());

    i.add(() => GetUserUseCase(datasource: i.get<UserDataSource>()));
    i.add(() => CancelOrderUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => GetServiceUseCase(datasource: i.get<ServiceDataSource>()));
    i.add(() => UploadProfilePhotoUsecase(datasource: i.get<ProfileDatasource>()));
    i.add(() => CreateServiceUseCase(datasource: i.get<ServiceDataSource>()));
    i.add(() => UploadMediaServiceUseCase(datasource: i.get<ServiceDataSource>()));

    i.add(() => GetWaitingApprovalOrdersUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => GetWaitingOrdersUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => GetProductionOrdersUsecase(datasource: i.get<ProposalDataSource>()));
    i.add(() => GetFinishedOrdersUsecase(datasource: i.get<ProposalDataSource>()));
    i.add(() => GetOrderDetailsUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => DownloadMediaUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => UpdateProfileUsecase(datasource: i.get<ProfileDatasource>()));
    i.add(() => ConfirmPaymentUsecase(datasource: i.get<PaymentDataSource>()));
    i.add(() => AproveProposalUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => RegisterFcmTokenUsecase(datasource: i.get<UserDataSource>()));

  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const NavigationPage());
    r.child(CustomerRouters.service, child: (context) => const ServicePage());

    r.child(CustomerRouters.serviceSuccess, child: (context) =>
        ServiceSuccesPage(order: r.args.data[0], serviceFile: r.args.data[1],type: r.args.data[2]));

    r.child(CustomerRouters.profile, child: (context) => const ProfilePage());
    r.child(CustomerRouters.profileForm, child: (context) => const ProfileFormPage());

    r.child(CustomerRouters.orderWaitingDetails, child: (context) => OrderWaitingDetailsPage(order: r.args.data));
    r.child(CustomerRouters.orderProposalDetails, child: (context) => OrderProposalDetailsPage(order: r.args.data));

    r.child(CustomerRouters.paymentProposal, child: (context) => PaymentPage(orderID: r.args.data));
    r.child(CustomerRouters.paymentSuccessProposal, child: (context) => const PaymentSuccessPage());

    r.child(CustomerRouters.production, child: (context) => OrderProductionPage(orderID: r.args.data));
  }
}