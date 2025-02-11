


import '../../external/notification_datasource.dart';

class ReadNotificationUsecase  {

final NotificationDataSource datasource;

ReadNotificationUsecase ({required this.datasource});

Future<void> call({required int notificationID}) async =>
    datasource.readNotification(notificationID: notificationID);

}