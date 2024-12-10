import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/login/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/login/register/presentation/components/documents/presentation/documents_page.dart';
import 'package:marcenaria/modules/login/register/presentation/register_page.dart';
import 'package:marcenaria/modules/login/register/presentation/stores/register_store.dart';

import 'presentation/login_page.dart';

class LoginModule extends Module {

  @override
  void binds(i) {
    i.add(() => RegisterStore());
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const LoginPage());
    r.child(RouterMapper.register, child: (context) => const RegisterPage());
    r.child(RouterMapper.document, child: (context) => const DocumentsPage());
  }
}