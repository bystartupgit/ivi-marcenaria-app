import 'package:marcenaria/modules/notification/domain/mappers/notification_mapper.dart';
import 'package:marcenaria/modules/notification/domain/enums/notification_type_enum.dart';

import '../../../../core/utils/date_utils.dart';

class NotificationEntity {
  final int id;
  final String message;
  final NotificationType type;
  final bool isRead;
  final DateTime date;

  NotificationEntity(
      {required this.id,
      required this.message,
      required this.type,
      required this.isRead,
      required this.date});

  factory NotificationEntity.fromMap(Map<String, dynamic> map) =>
      NotificationEntity(
          id: map[NotificationMapper.id],
          message: map[NotificationMapper.message],
          type: NotificationStatus.fromString(map[NotificationMapper.type]),
          date: DateUtil.convertStringToDatatime(map[NotificationMapper.date]),
          isRead: map[NotificationMapper.read]);

  NotificationEntity readNotification() => NotificationEntity(
      id: id, message: message, type: type, isRead: true, date: date);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is NotificationEntity) {
      return id == other.id;
    }
    return false;
  }

  @override
  int get hashCode => id.hashCode;
}
