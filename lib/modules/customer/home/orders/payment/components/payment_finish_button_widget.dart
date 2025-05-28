import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class PaymentFinishButtonWidget extends StatelessWidget {
  final String title = "Finalizar pedido";
  final Function()? onPressed;

  const PaymentFinishButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: ColorTheme.green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            elevation: 3),
        child: Text(title,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontFamily: FamilyTheme.medium,
                fontSize: 16)));
  }
}
