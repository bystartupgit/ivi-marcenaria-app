import 'package:flutter/material.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../../../core/themes/family_theme.dart';

class OrderEmptyWidget extends StatelessWidget {
  final String title;

  const OrderEmptyWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: FamilyTheme.regular,
                color: ColorTheme.pureBlack,
                fontSize: 16)));
  }
}
