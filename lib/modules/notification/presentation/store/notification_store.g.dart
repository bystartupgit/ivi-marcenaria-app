// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NotificationStore on NotificationStoreBase, Store {
  late final _$notificationsAtom =
      Atom(name: 'NotificationStoreBase.notifications', context: context);

  @override
  ObservableList<NotificationEntity> get notifications {
    _$notificationsAtom.reportRead();
    return super.notifications;
  }

  @override
  set notifications(ObservableList<NotificationEntity> value) {
    _$notificationsAtom.reportWrite(value, super.notifications, () {
      super.notifications = value;
    });
  }

  late final _$paginationAtom =
      Atom(name: 'NotificationStoreBase.pagination', context: context);

  @override
  int get pagination {
    _$paginationAtom.reportRead();
    return super.pagination;
  }

  @override
  set pagination(int value) {
    _$paginationAtom.reportWrite(value, super.pagination, () {
      super.pagination = value;
    });
  }

  late final _$limitAtom =
      Atom(name: 'NotificationStoreBase.limit', context: context);

  @override
  int get limit {
    _$limitAtom.reportRead();
    return super.limit;
  }

  @override
  set limit(int value) {
    _$limitAtom.reportWrite(value, super.limit, () {
      super.limit = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'NotificationStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$getNotificationsAsyncAction =
      AsyncAction('NotificationStoreBase.getNotifications', context: context);

  @override
  Future<void> getNotifications() {
    return _$getNotificationsAsyncAction.run(() => super.getNotifications());
  }

  late final _$getMoreNotificationsAsyncAction = AsyncAction(
      'NotificationStoreBase.getMoreNotifications',
      context: context);

  @override
  Future<void> getMoreNotifications() {
    return _$getMoreNotificationsAsyncAction
        .run(() => super.getMoreNotifications());
  }

  late final _$readNotificationAsyncAction =
      AsyncAction('NotificationStoreBase.readNotification', context: context);

  @override
  Future<void> readNotification(
      {required NotificationEntity notification, required int index}) {
    return _$readNotificationAsyncAction.run(
        () => super.readNotification(notification: notification, index: index));
  }

  late final _$NotificationStoreBaseActionController =
      ActionController(name: 'NotificationStoreBase', context: context);

  @override
  dynamic setLoading(bool value) {
    final _$actionInfo = _$NotificationStoreBaseActionController.startAction(
        name: 'NotificationStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$NotificationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addPagination() {
    final _$actionInfo = _$NotificationStoreBaseActionController.startAction(
        name: 'NotificationStoreBase.addPagination');
    try {
      return super.addPagination();
    } finally {
      _$NotificationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addAllNotifications(List<NotificationEntity> value) {
    final _$actionInfo = _$NotificationStoreBaseActionController.startAction(
        name: 'NotificationStoreBase.addAllNotifications');
    try {
      return super.addAllNotifications(value);
    } finally {
      _$NotificationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateReadNotification(NotificationEntity notification, int index) {
    final _$actionInfo = _$NotificationStoreBaseActionController.startAction(
        name: 'NotificationStoreBase.updateReadNotification');
    try {
      return super.updateReadNotification(notification, index);
    } finally {
      _$NotificationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notifications: ${notifications},
pagination: ${pagination},
limit: ${limit},
loading: ${loading}
    ''';
  }
}
