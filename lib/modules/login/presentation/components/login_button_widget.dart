import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class LoginButtonWidget extends StatelessWidget {
  final String title = "Entrar";
  final Function() onPress;

  const LoginButtonWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(
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
