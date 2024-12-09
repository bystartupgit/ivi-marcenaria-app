import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class RegisterCardOperationWidget extends StatelessWidget {

  final String title = "Quais serviços você pode oferecer?";
  final String description = "Selecione um ou mais serviços que você oferecerá em nossa plataforma.";

  const RegisterCardOperationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: ColorTheme.gray, blurRadius: 4.0, offset: const Offset(0.0, 5.0))],
            color: const Color(0xFFECECEC),
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: TextStyle(color: ColorTheme.black,fontFamily: FamilyTheme.bold,fontSize: 18)),
              Text(description,style: TextStyle(color: ColorTheme.black,fontFamily: FamilyTheme.regular,fontSize: 12))
            ]));
  }
}
