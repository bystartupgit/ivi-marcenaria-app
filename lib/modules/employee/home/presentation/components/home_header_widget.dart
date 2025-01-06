import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

import '../../../../../core/themes/color_theme.dart';

class HomeHeaderWidget extends StatelessWidget {

  final String title = "Seja bem vindo!";
  final String name;

  const HomeHeaderWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: name, style: TextStyle(color: ColorTheme.pureBlack,fontSize: 18,fontFamily: FamilyTheme.black)),
          TextSpan(text: title, style: TextStyle(color: ColorTheme.pureBlack,fontSize: 18,fontFamily: FamilyTheme.regular)),
        ]));
  }
}
