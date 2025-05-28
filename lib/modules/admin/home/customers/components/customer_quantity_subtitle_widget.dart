import 'package:flutter/material.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../../../core/themes/family_theme.dart';

class CustomerQuantitySubtitleWidget extends StatelessWidget {
  final String subtitle;
  final int quantity;
  final Color color;

  const CustomerQuantitySubtitleWidget(
      {super.key,
      required this.subtitle,
      required this.quantity,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: quantity.toString(),
              style: TextStyle(
                  color: ColorTheme.pureBlack,
                  fontSize: 12,
                  fontFamily: FamilyTheme.medium)),
          TextSpan(
              text: "  ",
              style: TextStyle(
                  color: ColorTheme.pureBlack,
                  fontSize: 12,
                  fontFamily: FamilyTheme.medium)),
          TextSpan(
              text: subtitle,
              style: TextStyle(
                  color: color, fontSize: 12, fontFamily: FamilyTheme.medium)),
        ],
      ),
    );
  }
}
