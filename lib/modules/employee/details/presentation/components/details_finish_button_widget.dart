
import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

import '../../../../../core/themes/color_theme.dart';

class DetailsFinishButtonWidget extends StatelessWidget {

  final String title;
  final Function() onPressed;

  const DetailsFinishButtonWidget({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            backgroundColor: ColorTheme.green, elevation: 3),
        child: Text(title,style: TextStyle(fontSize: 12, fontFamily: FamilyTheme.regular, color: Colors.white)));
  }
}
