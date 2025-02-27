
import 'package:flutter/material.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class CreateProporseTemporalWidget extends StatelessWidget {

  final String? group;
  final Function(String? value) onChanged;

  const CreateProporseTemporalWidget({super.key, required this.group, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Escassez temporal:",style: TextStyle(color: ColorTheme.black3,fontFamily: FamilyTheme.medium,fontSize: 10)),
        Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                  SizedBox(
                      width: 40,
                      child: Radio(value: "Sim", groupValue: group, onChanged: onChanged)),
                    Text("Sim",style: TextStyle(color: ColorTheme.black3,fontFamily: FamilyTheme.medium,fontSize: 10)),
                  ]),
              Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        width: 40,
                        child: Radio(value: "Não", groupValue: group, onChanged: onChanged)),
                    Text("Não",style: TextStyle(color: ColorTheme.black3,fontFamily: FamilyTheme.medium,fontSize: 10)),

                  ])
            ])
      ],
    );
  }
}
