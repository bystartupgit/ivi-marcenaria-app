import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class LoginNavigationTextWidget extends StatelessWidget {

  final String title;
  final Function() onPressed;

  const LoginNavigationTextWidget({super.key, required this.title, required this.onPressed });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: onPressed, child: Text(title,style: TextStyle(
        color: const Color(0xFF3B3B3B),
        fontSize: 12,
        fontFamily: FamilyTheme.regular)));
  }
}
