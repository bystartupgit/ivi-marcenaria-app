import 'package:flutter/material.dart';

import '../../../../core/themes/color_theme.dart';
import '../../../../core/themes/family_theme.dart';

class MessageSaveButtonWidget extends StatelessWidget {

  final String title;
  final Function()? onPress;

  const MessageSaveButtonWidget({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPress,
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorTheme.darkYellow,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
          child: Text(title, style: TextStyle(fontFamily: FamilyTheme.regular,color: ColorTheme.title, fontSize: 12)),
        ));
  }
}