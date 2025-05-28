import 'package:flutter/material.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class ServiceNameWidget extends StatelessWidget {
  final String title = "Qual nome deseja dar a este projeto?";
  final String description =
      "Isso ajudará você a localizar seu projeto mais facilmente em nosso aplicativo.";

  final String hint = "Projeto 1";
  final Function(String value) onChanged;

  const ServiceNameWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: ColorTheme.gray,
                  blurRadius: 4.0,
                  offset: const Offset(0.0, 5.0))
            ],
            color: ColorTheme.lightGray,
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title,
              style: TextStyle(
                  fontSize: 18,
                  color: ColorTheme.title,
                  fontFamily: FamilyTheme.bold)),
          const SizedBox(height: 2.0),
          Text(description,
              style: TextStyle(
                  fontSize: 12,
                  color: ColorTheme.title,
                  fontFamily: FamilyTheme.regular)),
          const SizedBox(height: 5.0),
          SizedBox(
            height: 50,
            child: TextField(
                style: TextStyle(
                    color: ColorTheme.gray,
                    fontSize: 16,
                    fontFamily: FamilyTheme.regular),
                onChanged: onChanged,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorTheme.search,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: ColorTheme.search)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: ColorTheme.search)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(color: ColorTheme.search)),
                    hintText: hint,
                    hintStyle: TextStyle(
                        fontFamily: FamilyTheme.regular,
                        fontSize: 16,
                        color: ColorTheme.description))),
          )
        ]));
  }
}
