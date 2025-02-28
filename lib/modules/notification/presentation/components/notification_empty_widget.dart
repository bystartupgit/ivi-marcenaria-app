
import 'package:flutter/material.dart';

import '../../../../core/themes/color_theme.dart';
import '../../../../core/themes/family_theme.dart';

class NotificationEmptyWidget extends StatelessWidget {

  final String title = "Nenhuma notificação disponível";

  const NotificationEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: FamilyTheme.regular, color: ColorTheme.pureBlack, fontSize: 16)));
  }
}
