import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/themes/color_theme.dart';
import '../../../../../../../core/themes/family_theme.dart';

class ProfileUpdateButtonWidget extends StatelessWidget {
  final String title = "Atualizar";
  final Function() onPress;

  const ProfileUpdateButtonWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
            elevation: 3,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            backgroundColor: ColorTheme.orange),
        child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.2),
            child: Text(title,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: FamilyTheme.regular))));
  }
}
