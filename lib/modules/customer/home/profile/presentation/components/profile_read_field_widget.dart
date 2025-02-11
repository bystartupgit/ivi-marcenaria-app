import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class ProfileReadFieldWidget extends StatelessWidget {

  final TextInputType keyboard;
  final TextEditingController controller;
  final IconData icon;

  final String hint;

  const ProfileReadFieldWidget({super.key,
    required this.hint,
    required this.keyboard, required this.icon, required this.controller });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      enabled: false,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10.0)),
          filled: true,
          hintText: hint,
          hintStyle: TextStyle(color: ColorTheme.gray,fontSize: 14, fontFamily: FamilyTheme.regular),
          prefixIcon: Icon(icon, color: controller.text.isEmpty ? ColorTheme.gray2 : ColorTheme.orange ),
          fillColor: ColorTheme.lightGray));
  }
}
