
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/modules/notification/domain/entities/notification_entity.dart';
import 'package:marcenaria/modules/notification/domain/enums/notification_type_enum.dart';
import 'package:marcenaria/modules/notification/presentation/store/notification_store.dart';

import '../../../../core/themes/color_theme.dart';
import '../../../../core/themes/family_theme.dart';
import '../../utils/date_notification_util.dart';

class NotificationCardWidget extends StatelessWidget {

  final NotificationStore store;
  final NotificationEntity notification;
  final int index;

  const NotificationCardWidget({super.key, required this.index, required this.notification, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => InkWell(
        onTap: notification.isRead? null : () => store.readNotification(notification: notification, index: index),
        child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: ColorTheme.gray, blurRadius: 4.0, offset: const Offset(0.0, 5.0))],
                color: const Color(0xFFECECEC),
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Transform.scale(
                        scaleX: -1,
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.1,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("assets/home/covers/1.jpeg"),fit: BoxFit.cover),
                                borderRadius: BorderRadius.all(Radius.circular(10.0)))),
                      )),
                  Expanded(
                      flex: 3,
                      child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(10.0),
                                  bottomRight: Radius.circular(10.0))
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(NotificationStatus.fromTitle(notification.type),
                                    maxLines: 2, style: TextStyle(
                                        fontFamily: FamilyTheme.medium,
                                        color: Colors.black, fontSize: 16)),
                                Expanded(
                                  child: Text(notification.message,
                                      overflow: TextOverflow.ellipsis, maxLines: 2,
                                      style: TextStyle(
                                      fontFamily: FamilyTheme.regular, color: ColorTheme.pureBlack, fontSize: 12)),
                                ),
                                Align(
                                  alignment: AlignmentDirectional.bottomEnd,
                                  child: Text(DateNotificationUtil.convertStringFormatfromDate(notification.date), style: TextStyle(
                                      fontFamily: FamilyTheme.regular, color: ColorTheme.pureBlack, fontSize: 10)),
                                ),

                              ])
                      ))
                ])),
      ),
    );
  }
}
