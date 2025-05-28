import 'package:flutter/material.dart';

import '../../../../core/themes/family_theme.dart';

class CancelButtonWidget extends StatelessWidget {
  final String title;

  final Function() onPressed;

  final double size;

  const CancelButtonWidget(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(5.0)),
            child: Row(
              spacing: 5.0,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title,
                    style: TextStyle(
                        fontSize: size,
                        fontFamily: FamilyTheme.regular,
                        color: Colors.red)),
              ],
            )));
  }
}
