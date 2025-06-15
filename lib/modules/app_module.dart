import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:marcenaria/core/data/router_global_mapper.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/modules/admin/admin_module.dart';
import 'package:marcenaria/modules/chat_private_support/chat_private_suport_module.dart';
import 'package:marcenaria/modules/customer/customer_module.dart';
import 'package:marcenaria/modules/employee/employee_module.dart';
import 'package:marcenaria/modules/notification/notification_module.dart';
import 'package:marcenaria/modules/onboarding/presentation/onboarding_page.dart';
import 'package:marcenaria/modules/onboarding/presentation/stores/onboarding_store.dart';
import 'package:marcenaria/modules/splash/splash_page.dart';

import 'admin/domain/usecases/get_order_details_without_employee_usecase.dart';
import 'admin/external/order_datasource.dart';
import 'chat_support/chat_module.dart';
import 'login/login_module.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(CoreStore.new);
    i.addSingleton(() => const FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true)));
    i.add(OnboardingStore.new);

    i.add(() => OrderDataSource());

    i.add(() => GetOrderDetailsWithoutEmployeeUsecase(
        datasource: i.get<OrderDataSource>()));
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const SplashPage());
    r.child(RouterGlobalMapper.onboarding, child: (_) => OnboardingPage());
    r.module(RouterGlobalMapper.login, module: LoginModule());
    r.module(RouterGlobalMapper.employee, module: EmployeeModule());
    r.module(RouterGlobalMapper.customer, module: CustomerModule());
    r.module(RouterGlobalMapper.admin, module: AdminModule());
    r.module(RouterGlobalMapper.notification, module: NotificationModule());
    r.module(RouterGlobalMapper.chatSupport, module: ChatSuportModule());
    r.module(RouterGlobalMapper.chatPrivateSupport,
        module: ChatPrivateSuportModule());
  }
}
