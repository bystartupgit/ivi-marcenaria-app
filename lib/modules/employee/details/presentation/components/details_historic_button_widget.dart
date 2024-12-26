import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class DetailsHistoricButtonWidget extends StatelessWidget {

  final String title = "Histórico de conversa suporte e cliente";

  const DetailsHistoricButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {},
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
            backgroundColor: ColorTheme.orange,elevation: 3),
        child: Text(title,style: TextStyle(fontSize: 14,fontFamily: FamilyTheme.medium, color: Colors.white )));
  }
}
