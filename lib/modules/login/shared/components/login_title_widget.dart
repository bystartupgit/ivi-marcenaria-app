import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class LoginTitleWidget extends StatelessWidget {

  final String title;

  const LoginTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(fontFamily: FamilyTheme.regular, fontSize: 32,color: const Color(0xFF545253)));
  }
}
