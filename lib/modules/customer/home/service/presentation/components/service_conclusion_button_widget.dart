import 'package:flutter/material.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class ServiceConclusionButtonWidget extends StatelessWidget {
  final String title = "Solicitar Orçamento";
  final Function() onPressed;

  const ServiceConclusionButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: ColorTheme.orange, width: 1.0),
                borderRadius: BorderRadius.circular(5.0)),
            backgroundColor: ColorTheme.orange,
            elevation: 0),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          child: Text(title,
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: FamilyTheme.regular,
                  color: Colors.white)),
        ));
  }
}
