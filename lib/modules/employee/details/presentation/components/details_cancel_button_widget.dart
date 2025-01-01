
import 'package:flutter/material.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../../../core/themes/family_theme.dart';

class DetailsCancelButtonWidget extends StatelessWidget {

  final String title = "Recusar Proposta";
  final Function() onPressed;

  const DetailsCancelButtonWidget({ super.key, required this.onPressed });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: ColorTheme.red,width: 1.0),
                borderRadius: BorderRadius.circular(5.0)),
            backgroundColor: ColorTheme.background, elevation: 0),
        child: Text(title,style: TextStyle(fontSize: 11,fontFamily: FamilyTheme.regular, color: Colors.red)));
  }
}
