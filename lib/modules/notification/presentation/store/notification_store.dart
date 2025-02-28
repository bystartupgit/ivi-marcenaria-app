
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/modules/notification/domain/entities/notification_entity.dart';
import 'package:marcenaria/modules/notification/domain/usecases/read_notification_usecase.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecases/get_notifications_usecase.dart';

part 'notification_store.g.dart';

class NotificationStore = NotificationStoreBase with _$NotificationStore;

abstract class NotificationStoreBase with Store {

  final GetNotificationsUsecase _getNotificationsUsecase = Modular.get<GetNotificationsUsecase>();
  final ReadNotificationUsecase _readNotificationUsecase = Modular.get<ReadNotificationUsecase>();

  @observable
  ObservableList<NotificationEntity> notifications = <NotificationEntity>[].asObservable();

  @observable
  int pagination = 1;

  @observable
  int limit = 10;

  @observable
  bool loading = true;

  @action
  setLoading(bool value) => loading = value;

  @action
  addPagination() => pagination ++;

  @action
  addAllNotifications(List<NotificationEntity> value) => notifications.addAll(value);

  @action
  updateReadNotification(NotificationEntity notification, int index) =>  notifications[index] = notification.readNotification();

  @action
  Future<void> getNotifications() async {

    setLoading(true);

    List<NotificationEntity> list = await _getNotificationsUsecase.call(
        userID: Modular.get<CoreStore>().auth?.id ?? 0,
        page: pagination, limit: limit);

    notifications = list.asObservable();

    setLoading(false);
  }

  @action
  Future<void> getMoreNotifications() async {

    List<NotificationEntity> current = List<NotificationEntity>.from(notifications);
    int count = notifications.length;

    if (count/pagination == limit) {

      addPagination();

      setLoading(true);

      List<NotificationEntity> list = await _getNotificationsUsecase.call(
          userID: Modular.get<CoreStore>().auth?.id ?? 0,
          page: pagination, limit: limit);

      if(list.isNotEmpty) { addAllNotifications(list); }

      setLoading(false);

    }

    else  {

      setLoading(true);

      List<NotificationEntity> list = await _getNotificationsUsecase.call(
          userID: Modular.get<CoreStore>().auth?.id ?? 0,
          page: pagination, limit: limit);


      if(list.isNotEmpty) {
        List<NotificationEntity> newNotifications = list.where((e)
            => !notifications.contains(e)).toList();

        notifications.addAll(newNotifications);
      }

      setLoading(false);
    }
  }

  @action
  Future<void> readNotification({required NotificationEntity notification, required int index}) async {

    try {

      updateReadNotification(notification, index);
      _readNotificationUsecase.call(notificationID: notification.id);

    } catch(e) { debugPrint(e.toString()); }

  }
}