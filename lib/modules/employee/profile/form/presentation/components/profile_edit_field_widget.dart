import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../../core/themes/color_theme.dart';
import '../../../../../../../core/themes/family_theme.dart';

class ProfileEditFieldWidget extends StatelessWidget {
  final IconData icon;
  final String hint;
  final String label;
  final TextEditingController controller;
  final List<TextInputFormatter>? formatters;
  final TextInputType keyboard;

  const ProfileEditFieldWidget(
      {super.key,
      required this.label,
      this.keyboard = TextInputType.text,
      this.formatters,
      required this.hint,
      required this.controller,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: TextField(
          controller: controller,
          keyboardType: keyboard,
          inputFormatters: formatters,
          decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0)),
              filled: true,
              hintText: hint,
              label: Text(label),
              hintStyle: TextStyle(
                  color: ColorTheme.gray,
                  fontSize: 14,
                  fontFamily: FamilyTheme.regular),
              suffixIcon: Icon(icon,
                  color: controller.text.isEmpty
                      ? ColorTheme.gray2
                      : ColorTheme.orange,
                  size: 20),
              fillColor: ColorTheme.lightGray)),
    );
  }
}
