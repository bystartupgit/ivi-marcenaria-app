import 'package:flutter/material.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class PaymentButtonWidget extends StatelessWidget {

  final Function () onPressed;
  final String title = "Aceitar e prosseguir";

  const PaymentButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 3,
        child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: ColorTheme.green,
                borderRadius: BorderRadius.circular(5.0)
            ),
            child: Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 12,
                fontFamily: FamilyTheme.regular, color: Colors.white ))),
      ),
    );
  }
}
