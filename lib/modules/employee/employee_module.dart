


import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/employee/navigation/navigation_page.dart';
import 'package:marcenaria/modules/employee/navigation/stores/navigation_store.dart';

class EmployeeModule extends Module {

  @override
  void binds(i) {
    i.add(() => NavigationStore());
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const NavigationPage());
  }
}