import 'package:flutter/material.dart';

import '../../../../../../../core/themes/family_theme.dart';

class OrderDetailsRichWidget extends StatelessWidget {

  final String title;
  final String description;

  const OrderDetailsRichWidget({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: "$title ", style: TextStyle(fontSize: 14,color: Colors.black, fontFamily: FamilyTheme.mediumItalic)),
          TextSpan(text: description, style: TextStyle(fontSize: 12,color: Colors.black, fontFamily: FamilyTheme.regular)),
        ],
      ),
    );
  }
}