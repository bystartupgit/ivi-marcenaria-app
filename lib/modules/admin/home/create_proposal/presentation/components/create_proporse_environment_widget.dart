import 'package:flutter/material.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class CreateProporseEnvironmentWidget extends StatelessWidget {

  final String title = "Ambientes:";

  final int maxLines = 5;
  final Function(String value) onChanged;

  const CreateProporseEnvironmentWidget({super.key, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
        spacing: 5.0,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: TextStyle(color: ColorTheme.black3,fontFamily: FamilyTheme.medium,fontSize: 14)),
          TextField(
              style: TextStyle(color: ColorTheme.black3,
                  fontSize: 12,
                  fontFamily: FamilyTheme.regular),
              onChanged: onChanged,
              maxLines: maxLines,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: ColorTheme.search,
                  counterStyle: TextStyle(fontFamily: FamilyTheme.regular,color: ColorTheme.description,fontSize: 10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: ColorTheme.search)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: ColorTheme.search)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                          color: ColorTheme.search)))),

        ]);
  }
}
