import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class LoginGreetingsWidget extends StatelessWidget {
  final String greetings = "Bem vindo de volta!";

  const LoginGreetingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(greetings,
        style: TextStyle(
            fontFamily: FamilyTheme.regular,
            fontSize: 14,
            color: const Color(0xFF545253)));
  }
}
