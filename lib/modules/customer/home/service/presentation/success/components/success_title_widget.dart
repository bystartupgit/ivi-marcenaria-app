
import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

import '../../../../../../../core/themes/color_theme.dart';

class SuccessTitleWidget extends StatelessWidget {

  final String title = "Seu orçamento foi solicitado \ncom sucesso!!!";

  final String description = "Nossa equipe realizará análise do seu orçamento. "
      "Assim que o orçamento estiver disponível enviaremos uma notificação.";

  const SuccessTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5.0,
      children: [
        Text(title, style: TextStyle(fontFamily: FamilyTheme.medium, color: ColorTheme.black3, fontSize: 20)),
        Text(description, textAlign: TextAlign.left, style: TextStyle(fontFamily: FamilyTheme.regular, color: ColorTheme.black3, fontSize: 12))
      ],
    );
  }
}

