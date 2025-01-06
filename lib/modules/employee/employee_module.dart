


import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/employee/details/presentation/details_page.dart';
import 'package:marcenaria/modules/employee/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/employee/home/presentation/stores/home_store.dart';
import 'package:marcenaria/modules/employee/navigation/navigation_page.dart';
import 'package:marcenaria/modules/employee/navigation/stores/navigation_store.dart';
import 'package:marcenaria/modules/employee/orders/presentation/stores/order_store.dart';

class EmployeeModule extends Module {

  @override
  void binds(i) {
    i.add(() => NavigationStore());
    i.add(() => HomeStore());
    i.add(() => OrderStore());
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const NavigationPage());
    r.child(RouterMapper.details, child: (context) => const DetailsPage());
  }
}