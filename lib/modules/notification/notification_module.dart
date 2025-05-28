import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/notification/domain/usecases/read_notification_usecase.dart';
import 'package:marcenaria/modules/notification/presentation/notification_page.dart';
import 'package:marcenaria/modules/notification/presentation/store/notification_store.dart';

import 'domain/usecases/get_notifications_usecase.dart';
import 'external/notification_datasource.dart';

class NotificationModule extends Module {
  @override
  void binds(i) {
    i.add(() => NotificationStore());

    i.add(() => NotificationDataSource());

    i.add(() =>
        GetNotificationsUsecase(datasource: i.get<NotificationDataSource>()));
    i.add(() =>
        ReadNotificationUsecase(datasource: i.get<NotificationDataSource>()));
  }

  @override
  void routes(r) {
    r.child(Modular.initialRoute, child: (context) => const NotificationPage());
  }
}
