import 'package:flutter/material.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../../../core/themes/family_theme.dart';

class DetailsSuportButtonWidget extends StatelessWidget {
  final String title = "Conversar com suporte";

  const DetailsSuportButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            backgroundColor: ColorTheme.orange,
            elevation: 3),
        child: Text(title,
            style: TextStyle(
                fontSize: 12,
                fontFamily: FamilyTheme.medium,
                color: Colors.white)));
  }
}
