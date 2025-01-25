


import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/customer/navigation/presentation/stores/navigation_store.dart';

import 'navigation/presentation/navigation_page.dart';

class CustomerModule extends Module {

  @override
  void binds(i) {
    i.add(() => NavigationStore());
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const NavigationPage());
  }
}