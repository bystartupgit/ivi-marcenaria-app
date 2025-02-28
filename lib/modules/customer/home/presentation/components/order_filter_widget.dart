import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';

import '../../../../../core/themes/family_theme.dart';

class OrderFilterWidget extends StatelessWidget {

  final String title;
  final String description;

  final String hint = "Pesquisar";
  final Function(String value) onChanged;

  const OrderFilterWidget({ super.key, required this.onChanged, required this.title, required this.description });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: ColorTheme.gray, blurRadius: 4.0, offset: const Offset(0.0, 5.0))],
            color: ColorTheme.lightGray,
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: TextStyle(fontSize: 16,color: ColorTheme.title,fontFamily: FamilyTheme.bold)),
              const SizedBox(height: 2.0),
              Text(description, style: TextStyle(fontSize: 12,color: ColorTheme.title,fontFamily: FamilyTheme.regular)),
              const SizedBox(height: 10.0),
              SizedBox(
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
                        hintStyle: TextStyle(fontFamily: FamilyTheme.regular,fontSize: 16,color: ColorTheme.description))),)
            ]));
  }
}