import 'package:flutter/material.dart';

import '../../../../core/themes/color_theme.dart';
import '../../../../core/themes/family_theme.dart';

class PopUpSuccessWidget extends StatelessWidget {
  final String title = "Sucesso";
  final String content;
  final VoidCallback? onOkPressed;

  const PopUpSuccessWidget({
    super.key,
    required this.content,
    this.onOkPressed,
  });

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
                    color: ColorTheme.green,
                    fontSize: 14,
                    fontFamily: FamilyTheme.bold)),
            Text(content,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorTheme.black,
                    fontSize: 12,
                    fontFamily: FamilyTheme.regular)),
            if (onOkPressed != null)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    onOkPressed?.call();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTheme.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("OK"),
                ),
              ),
          ]),
    ));
  }
}
