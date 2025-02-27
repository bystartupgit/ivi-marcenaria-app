import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/login/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/login/domain/usecases/login_usecase.dart';
import 'package:marcenaria/modules/login/domain/usecases/register_usecase.dart';
import 'package:marcenaria/modules/login/external/login_datasource.dart';
import 'package:marcenaria/modules/login/presentation/stores/login_store.dart';
import 'package:marcenaria/modules/login/register/presentation/components/contract/presentation/contract_page.dart';
import 'package:marcenaria/modules/login/register/presentation/components/contract/presentation/store/contract_store.dart';
import 'package:marcenaria/modules/login/register/presentation/components/documents/presentation/documents_page.dart';
import 'package:marcenaria/modules/login/register/presentation/components/success/register_success_page.dart';
import 'package:marcenaria/modules/login/register/presentation/register_page.dart';
import 'package:marcenaria/modules/login/register/presentation/stores/register_store.dart';

import 'presentation/login_page.dart';

class LoginModule extends Module {

  @override
  void binds(i) {
    i.add(() => LoginStore());
    i.add(() => ContractStore());
    i.add(() => RegisterStore());

    i.add(() => LoginDataSource());
    i.add(() => LoginUseCase(datasource: i.get<LoginDataSource>()));
    i.add(() => RegisterUseCase(datasource: i.get<LoginDataSource>()));
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const LoginPage());
    r.child(RouterMapper.register, child: (context) => const RegisterPage());
    r.child(RouterMapper.document, child: (context) => const DocumentsPage());
    r.child(RouterMapper.contract, child: (context) => const ContractPage());
    r.child(RouterMapper.success, child: (context) => const RegisterSuccessPage());
  }
}