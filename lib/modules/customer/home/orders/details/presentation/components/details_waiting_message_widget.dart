import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class DetailsWaitingMessageWidget extends StatelessWidget {
  final String title = "Nossa equipe realizará análise do seu orçamento. "
      "Assim que o orçamento estiver disponível enviaremos uma notificação.";

  const DetailsWaitingMessageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontFamily: FamilyTheme.regular));
  }
}
