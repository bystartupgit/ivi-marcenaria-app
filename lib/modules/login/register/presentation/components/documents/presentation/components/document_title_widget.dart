import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class DocumentTitleWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const DocumentTitleWidget(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(title,
          style: TextStyle(
              fontFamily: FamilyTheme.medium,
              fontSize: 18,
              color: ColorTheme.title)),
      Text(subtitle,
          style: TextStyle(
              fontFamily: FamilyTheme.regular,
              fontSize: 12,
              color: ColorTheme.subtitle)),
    ]);
  }
}
