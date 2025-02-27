import 'package:flutter/material.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class ProposalRichTitleWidget extends StatelessWidget {

  final String title = "Valor total: ";
  final String total;

  const ProposalRichTitleWidget({ super.key, required this.total});

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: title, style: TextStyle(color: ColorTheme.pureBlack,fontSize: 12,fontFamily: FamilyTheme.medium)),
          TextSpan(text: total, style: TextStyle(color: ColorTheme.pureBlack,fontSize: 12,fontFamily: FamilyTheme.regular)),
        ],
      ),
    );
  }
}