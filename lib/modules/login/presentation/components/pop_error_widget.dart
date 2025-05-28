import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class PopUpErrorWidget extends StatelessWidget {
  final String title = "Error";
  final String content;

  const PopUpErrorWidget({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 15.0,
          children: [
            Text(title,
                style: TextStyle(
                    color: ColorTheme.red,
                    fontSize: 14,
                    fontFamily: FamilyTheme.bold)),
            Text(content,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorTheme.black,
                    fontSize: 12,
                    fontFamily: FamilyTheme.regular))
          ]),
    ));
  }
}
