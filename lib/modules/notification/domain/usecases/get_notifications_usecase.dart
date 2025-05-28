import 'package:marcenaria/modules/notification/domain/entities/notification_entity.dart';

import '../../external/notification_datasource.dart';

class GetNotificationsUsecase {
  final NotificationDataSource datasource;

  GetNotificationsUsecase({required this.datasource});

  Future<List<NotificationEntity>> call(
          {required int userID, required int page, required int limit}) async =>
      datasource.getNotifications(userID: userID, page: page, limit: limit);
}
