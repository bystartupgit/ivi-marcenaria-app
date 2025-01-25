import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/router_global_mapper.dart';
import 'package:marcenaria/modules/admin/admin_module.dart';
import 'package:marcenaria/modules/customer/customer_module.dart';
import 'package:marcenaria/modules/employee/employee_module.dart';
import 'package:marcenaria/modules/onboarding/presentation/onboarding_page.dart';
import 'package:marcenaria/modules/onboarding/presentation/stores/onboarding_store.dart';

import 'login/login_module.dart';

class AppModule extends Module {

  @override
  void binds(i) {
    i.add(OnboardingStore.new);
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const OnboardingPage());
    r.module(RouterGlobalMapper.login, module: LoginModule());
    r.module(RouterGlobalMapper.employee, module: EmployeeModule());
    r.module(RouterGlobalMapper.customer, module: CustomerModule());
    r.module(RouterGlobalMapper.admin, module: AdminModule());
  }

}