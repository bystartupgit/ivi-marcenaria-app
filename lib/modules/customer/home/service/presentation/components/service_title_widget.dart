import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class ServiceTitleWidget extends StatelessWidget {
  final String title = "Solicitar um novo orçamento";

  const ServiceTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
            fontFamily: FamilyTheme.medium,
            color: ColorTheme.black3,
            fontSize: 20));
  }
}
