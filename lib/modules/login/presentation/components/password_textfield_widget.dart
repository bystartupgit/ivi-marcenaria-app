import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';


class PasswordTextFieldWidget extends StatelessWidget {

  final String title;
  final IconData icon;

  final Function(String value) onChanged;
  final TextInputType keyboard;

  const PasswordTextFieldWidget({super.key,required this.title,
    required this.onChanged,
    this.icon = Icons.add, this.keyboard = TextInputType.text });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: ColorTheme.gray,fontSize: 16,fontFamily: FamilyTheme.regular),
      onChanged: onChanged,
      obscureText: true,
      obscuringCharacter: "*",
      keyboardType: keyboard,
      decoration: InputDecoration(labelText: title,
          suffixIcon: Icon(icon,size: 15,color: const Color.fromRGBO(59, 59, 59, 0.5)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorTheme.gray)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorTheme.gray)),
          labelStyle: TextStyle(fontFamily: FamilyTheme.regular,fontSize: 14,color: ColorTheme.title)),
    );
  }
}