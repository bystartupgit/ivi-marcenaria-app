import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/customer/data/routers/customer_routers.dart';
import 'package:marcenaria/modules/customer/home/domain/usecases/get_user_usecase.dart';
import 'package:marcenaria/modules/customer/home/external/user_datasource.dart';
import 'package:marcenaria/modules/customer/home/presentation/stores/home_store.dart';
import 'package:marcenaria/modules/customer/home/service/domain/usecases/create_service_usecase.dart';
import 'package:marcenaria/modules/customer/home/service/domain/usecases/upload_media_service_usecase.dart';
import 'package:marcenaria/modules/customer/home/service/external/service_datasource.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/service_page.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/stores/service_store.dart';
import 'package:marcenaria/modules/customer/navigation/presentation/stores/navigation_store.dart';

import 'navigation/presentation/navigation_page.dart';

class CustomerModule extends Module {

  @override
  void binds(i) {
    i.add(() => NavigationStore());
    i.add(() => HomeStore());
    i.add(() => ServiceStore());

    i.add(() => ServiceDataSource());
    i.add(() => UserDataSource());

    i.add(() => GetUserUseCase(datasource: i.get<UserDataSource>()));
    i.add(() => CreateServiceUseCase(datasource: i.get<ServiceDataSource>()));
    i.add(() => UploadMediaServiceUseCase(datasource: i.get<ServiceDataSource>()));

  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const NavigationPage());
    r.child(CustomerRouters.service, child: (context) => const ServicePage());
  }
}