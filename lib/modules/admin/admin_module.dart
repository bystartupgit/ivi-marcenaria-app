

import 'package:flutter_modular/flutter_modular.dart';

import 'navigation/navigation_page.dart';

class AdminModule extends Module {

  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const NavigationPage());
  }
}