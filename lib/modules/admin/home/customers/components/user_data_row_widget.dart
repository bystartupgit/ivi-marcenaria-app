import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';

import '../../../../../core/themes/family_theme.dart';

class UserDataRowWidget extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final String? value;

  const UserDataRowWidget(
      {super.key,
      required this.icon,
      required this.placeholder,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(spacing: 5.0, mainAxisSize: MainAxisSize.min, children: [
      Icon(
        icon,
        color: value == null ? ColorTheme.gray2 : ColorTheme.orange,
        size: 10,
      ),
      Text(
        value ?? placeholder,
        style: TextStyle(
            color: value == null ? ColorTheme.gray : Colors.orange,
            fontSize: 10,
            fontFamily: FamilyTheme.regular),
      )
    ]);
  }
}
