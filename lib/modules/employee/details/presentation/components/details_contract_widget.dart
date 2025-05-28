import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';

import '../../../../../core/themes/family_theme.dart';

class DetailsContractWidget extends StatelessWidget {
  final String title = "Proposta de produção";

  const DetailsContractWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.0,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title,
            style: TextStyle(
                color: ColorTheme.black3,
                fontFamily: FamilyTheme.bold,
                fontSize: 16)),
        Container(
            decoration: BoxDecoration(
                color: ColorTheme.lightGray,
                borderRadius: const BorderRadius.all(Radius.circular(10.0))),
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Valores da proposta:",
                  style: TextStyle(
                      fontFamily: FamilyTheme.regular,
                      color: Colors.black,
                      fontSize: 10)),
              Text("R\$4000,00",
                  style: TextStyle(
                      fontFamily: FamilyTheme.bold,
                      color: Colors.black,
                      fontSize: 30)),
              Text("o valor será pago em 10x R\$400,00",
                  style: TextStyle(
                      fontFamily: FamilyTheme.regular,
                      color: Colors.black,
                      fontSize: 10))
            ])),
      ],
    );
  }
}
