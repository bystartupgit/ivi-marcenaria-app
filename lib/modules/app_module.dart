import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/router_global_mapper.dart';
import 'package:marcenaria/modules/employee/employee_module.dart';

import 'login/login_module.dart';

class AppModule extends Module {

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module(Modular.initialRoute, module: LoginModule());
    r.module(RouterGlobalMapper.employee, module: EmployeeModule());
  }

}