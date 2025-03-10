


import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/customer/home/profile/external/profile_datasource.dart';
import 'package:marcenaria/modules/employee/conversation/conversation_store.dart';
import 'package:marcenaria/modules/employee/details/presentation/details_page.dart';
import 'package:marcenaria/modules/employee/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/employee/domain/usecases/get_user_usecase.dart';
import 'package:marcenaria/modules/employee/external/user_datasource.dart';
import 'package:marcenaria/modules/employee/home/presentation/stores/home_store.dart';
import 'package:marcenaria/modules/employee/navigation/navigation_page.dart';
import 'package:marcenaria/modules/employee/navigation/stores/navigation_store.dart';
import 'package:marcenaria/modules/employee/orders/domain/usecases/accept_proposal_usecase.dart';
import 'package:marcenaria/modules/employee/orders/domain/usecases/decline_proposal_usecase.dart';
import 'package:marcenaria/modules/employee/orders/domain/usecases/get_order_details_usecase.dart';
import 'package:marcenaria/modules/employee/orders/external/order_datasource.dart';
import 'package:marcenaria/modules/employee/orders/presentation/stores/order_peding/details/order_peding_details_page.dart';
import 'package:marcenaria/modules/employee/orders/presentation/stores/order_peding/details/stores/order_peding_details_store.dart';
import 'package:marcenaria/modules/employee/orders/presentation/stores/order_store.dart';
import 'package:marcenaria/modules/employee/orders/presentation/stores/waiting_interesting/details/waiting_interesting_details_page.dart';
import 'package:marcenaria/modules/employee/profile/presentation/profile_page.dart';
import 'package:marcenaria/modules/employee/profile/presentation/stores/profile_store.dart';
import 'package:marcenaria/modules/employee/service/domain/usecases/finish_service_usecase.dart';
import 'package:marcenaria/modules/employee/service/domain/usecases/get_service_finish_usecase.dart';
import 'package:marcenaria/modules/employee/service/domain/usecases/get_service_production_usecase.dart';
import 'package:marcenaria/modules/employee/service/external/service_datasource.dart';
import 'package:marcenaria/modules/employee/service/presentation/finish/details/finish_details_page.dart';
import 'package:marcenaria/modules/employee/service/presentation/finish/details/stores/finish_details_store.dart';
import 'package:marcenaria/modules/employee/service/presentation/finish/stores/finish_store.dart';
import 'package:marcenaria/modules/employee/service/presentation/production/details/production_details_page.dart';
import 'package:marcenaria/modules/employee/service/presentation/production/details/stores/production_details_store.dart';
import 'package:marcenaria/modules/employee/service/presentation/production/stores/production_store.dart';
import 'package:marcenaria/modules/employee/service/presentation/stores/service_store.dart';

import '../customer/home/profile/domain/usecases/upload_profile_photo_usecase.dart';
import 'domain/usecases/register_fcm_token_usecase.dart';
import 'orders/domain/usecases/get_order_not_started_usecase.dart';
import 'orders/domain/usecases/get_waiting_interest_orders_usecase.dart';
import 'orders/domain/usecases/start_service_usecase.dart';
import 'orders/presentation/stores/waiting_interesting/details/components/details_success_page_widget.dart';
import 'orders/presentation/stores/waiting_interesting/details/stores/waiting_interesting_details_store.dart';
import 'orders/presentation/stores/waiting_interesting/stores/order_pending_store.dart';
import 'orders/presentation/stores/waiting_interesting/stores/waiting_interesting_store.dart';

class EmployeeModule extends Module {

  @override
  void binds(i) {
    i.addSingleton(() => NavigationStore());
    i.add(() => ProfileStore());
    i.add(() => HomeStore());
    i.add(() => ConversationStore());

    i.addSingleton(() => OrderStore());
    i.add(() => WaitingInterestiongStore());
    i.add(() => WaitingInterestingDetailsStore());
    i.add(() => OrderPendingStore());
    i.add(() => OrderPedingDetailsStore());

    i.addSingleton(() => ServiceStore());
    i.add(() => ProductionStore());
    i.add(() => FinishStore());

    i.add(() => UserDataSource());
    i.add(() => OrderDataSource());
    i.add(() => ServiceDataSource());
    i.add(() => ProfileDatasource());
    i.add(() => ProductionDetailsStore());
    i.add(() => FinishDetailsStore());

    i.add(() => GetUserUseCase(datasource: i.get<UserDataSource>()));
    i.add(() => GetWaitingInterestOrdersUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => GetOrderDetailsUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => AcceptProposalUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => DeclineProposalUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => GetOrderNotStartedUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => StartServiceUsecase(datasource: i.get<OrderDataSource>()));
    i.add(() => GetServiceProductionUsecase(datasource: i.get<ServiceDataSource>()));
    i.add(() => GetServiceFinishUsecase(datasource: i.get<ServiceDataSource>()));
    i.add(() => FinishServiceUsecase(datasource: i.get<ServiceDataSource>()));
    i.add(() => UploadProfilePhotoUsecase(datasource: i.get<ProfileDatasource>()));

    i.add(() => RegisterFcmTokenUsecase(datasource: i.get<UserDataSource>()));

  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const NavigationPage());
    r.child(RouterMapper.profile, child: (context) => const ProfilePage());
    r.child(RouterMapper.details, child: (context) => const DetailsPage());

    r.child(RouterMapper.orderWaitingDetails, child: (context) => WaitingInterestingDetailsPage(orderID: r.args.data));
    r.child(RouterMapper.orderWaitingSuccessDetails, child: (context) => const AprovalProposalSuccessPage());
    r.child(RouterMapper.orderPendingDetails, child: (context) => OrderPedingDetailsPage(orderID: r.args.data));

    r.child(RouterMapper.productionDetails, child: (context) => ProductionDetailsPage(orderID: r.args.data));
    r.child(RouterMapper.finishDetails, child: (context) => FinishDetailsPage(orderID: r.args.data));
  }
}