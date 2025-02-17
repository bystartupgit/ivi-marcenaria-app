


import 'package:flutter/material.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class CreateProposalDaysWidget extends StatelessWidget {

  final String title = "Prazo para conclusão:";
  final List<String> items = ['30 dias uteis', '45 dias uteis', '60 dias uteis', '90 dias uteis'];

  CreateProposalDaysWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.0,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(color: ColorTheme.black3,fontFamily: FamilyTheme.medium,fontSize: 10)),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: ColorTheme.search,
          ),
          child: DropdownButton<String>(
            alignment: AlignmentDirectional.center,
            iconSize: 0.0,
            icon: null,

            hint: Text('Escolha um item', style: TextStyle(color: ColorTheme.gray,
                fontSize: 12, fontFamily: FamilyTheme.regular)), // Texto exibido quando nada for selecionado
            value: '30 dias uteis',
            style: TextStyle(color: ColorTheme.black3,
                fontSize: 12, fontFamily: FamilyTheme.regular),
            onChanged: (newValue) {},
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
