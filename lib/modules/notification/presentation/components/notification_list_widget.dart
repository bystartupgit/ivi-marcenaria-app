import 'package:flutter/material.dart';
import 'package:marcenaria/modules/notification/domain/entities/notification_entity.dart';
import 'package:marcenaria/modules/notification/external/notification_datasource.dart';
import 'package:marcenaria/modules/notification/presentation/components/notification_empty_widget.dart';

import '../../../../core/themes/color_theme.dart';
import '../../../../core/themes/family_theme.dart';
import '../store/notification_store.dart';
import 'notification_card_widget.dart';

class NotificationListWidget extends StatelessWidget {
  final Function() loadingMoreNotifications;
  final List<NotificationEntity> notifications;

  final NotificationStore store;

  final String title = "Aqui estão todas as interações recentes";

  const NotificationListWidget(
      {super.key,
      required this.store,
      required this.notifications,
      required this.loadingMoreNotifications});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () => loadingMoreNotifications(),
      child: Container(
          child: notifications.isEmpty
              ? const NotificationEmptyWidget()
              : SingleChildScrollView(
                  child: Column(
                    spacing: 10.0,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: TextStyle(
                              fontFamily: FamilyTheme.regular,
                              color: ColorTheme.pureBlack,
                              fontSize: 14)),
                      ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 10.0),
                          itemCount: notifications.length,
                          itemBuilder: (context, index) =>
                              NotificationCardWidget(
                                  store: store,
                                  index: index,
                                  notification: notifications[index])),
                    ],
                  ),
                )),
    );
  }
}
