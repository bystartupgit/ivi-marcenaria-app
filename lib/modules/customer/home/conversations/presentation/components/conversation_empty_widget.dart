import 'package:flutter/material.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class ConversationEmptyWidget extends StatelessWidget {

  final String title = "Nenhuma conversa iniciada";

  const ConversationEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(child: Text(title,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: FamilyTheme.regular, color: ColorTheme.pureBlack, fontSize: 16))),
    );
  }
}
