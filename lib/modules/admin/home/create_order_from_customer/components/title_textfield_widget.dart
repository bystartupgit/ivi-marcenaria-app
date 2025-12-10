import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class TitleTextFieldWidget extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Function(String value) onChanged;
  final TextInputType keyboard;

  const TitleTextFieldWidget({
    super.key,
    required this.title,
    required this.onChanged,
    required this.description,
    this.icon = Icons.title,
    this.keyboard = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
          color: ColorTheme.gray,
          fontSize: 16,
          fontFamily: FamilyTheme.regular),
      onChanged: onChanged,
      keyboardType: keyboard,
      decoration: InputDecoration(
          suffixIcon: Icon(icon,
              size: 24, color: const Color.fromRGBO(59, 59, 59, 0.5)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorTheme.gray)),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorTheme.gray)),
          hintText: description,
          hintStyle: TextStyle(
              fontFamily: FamilyTheme.regular,
              fontSize: 16,
              color: ColorTheme.description),
          labelText: title,
          labelStyle: TextStyle(
              fontFamily: FamilyTheme.regular,
              fontSize: 14,
              color: ColorTheme.title)),
    );
  }
}

