import 'package:flutter/material.dart';

import '../../../../core/themes/color_theme.dart';
import '../../../../core/themes/family_theme.dart';

class ConfirmationButtonWidget extends StatelessWidget {
  final String title;
  final Function()? onPressed;

  final double size;

  const ConfirmationButtonWidget(
      {super.key,
      required this.title,
      required this.onPressed,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 3,
        child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: onPressed == null ? ColorTheme.gray : ColorTheme.green,
                borderRadius: BorderRadius.circular(5.0)),
            child: Center(
                child: Text(title,
                    style: TextStyle(
                        fontSize: size,
                        fontFamily: FamilyTheme.medium,
                        color: Colors.white)))),
      ),
    );
  }
}
