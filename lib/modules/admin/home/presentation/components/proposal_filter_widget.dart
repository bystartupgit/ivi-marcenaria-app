import 'package:flutter/material.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../../../core/themes/family_theme.dart';

class ProposalFilterWidget extends StatelessWidget {

  final String hint = "Pesquisar";
  final Function(String value) onChanged;

  const ProposalFilterWidget({ super.key, required this.onChanged });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: ColorTheme.gray, blurRadius: 4.0, offset: const Offset(0.0, 5.0))],
            color: ColorTheme.lightGray,
            borderRadius: BorderRadius.circular(10.0)),
        child: SizedBox(
          height: 50,
          child: TextField(
              style: TextStyle(color: ColorTheme.gray,fontSize: 16,fontFamily: FamilyTheme.regular),
              onChanged: onChanged,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorTheme.search,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: ColorTheme.search)) ,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: ColorTheme.search)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(color: ColorTheme.search)),
                  hintText: hint,
                  hintStyle: TextStyle(fontFamily: FamilyTheme.regular,fontSize: 16,color: ColorTheme.description))),));
  }
}