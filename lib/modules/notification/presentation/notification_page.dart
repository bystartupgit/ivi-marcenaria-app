import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/notification/presentation/components/notification_list_widget.dart';
import 'package:marcenaria/modules/notification/presentation/components/notification_loading_widget.dart';
import 'package:marcenaria/modules/notification/presentation/store/notification_store.dart';

import '../../../core/themes/color_theme.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  final NotificationStore store = Modular.get<NotificationStore>();

  @override
  void initState() {
    store.getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) => Scaffold(
            backgroundColor: ColorTheme.background,
            appBar: AppBar(
                leading: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios_new_rounded,
                        size: 20, color: ColorTheme.black)),
                backgroundColor: ColorTheme.background),
            body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: store.loading
                    ? const NotificationLoadingWidget()
                    : NotificationListWidget(
                        store: store,
                        notifications: store.notifications,
                        loadingMoreNotifications: () =>
                            store.getMoreNotifications()))));
  }
}
