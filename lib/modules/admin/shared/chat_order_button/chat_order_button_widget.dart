import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

import '../../../../core/themes/color_theme.dart';

class ChatOrderButtonWidget extends StatelessWidget {
  final String title;
  final Function() onPressed;

  final double size;

  const ChatOrderButtonWidget(
      {super.key,
      required this.title,
      required this.size,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 3,
        child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                color: ColorTheme.orange,
                borderRadius: BorderRadius.circular(5.0)),
            child: Center(
                child: Text(title,
                    style: TextStyle(
                        fontSize: size,
                        fontFamily: FamilyTheme.regular,
                        color: Colors.white)))),
      ),
    );
  }
}
