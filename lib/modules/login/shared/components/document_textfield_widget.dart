

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/login/register/presentation/utils/cpf_formatter_util.dart';

class DocumentTextFieldWidget extends StatelessWidget {

  final String title;
  final IconData icon;

  final Function(String value) onChanged;
  final TextInputType keyboard;

  const DocumentTextFieldWidget({super.key,required this.title,
    required this.onChanged,
    this.icon = Icons.add, this.keyboard = TextInputType.number});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: ColorTheme.gray,fontSize: 16,fontFamily: FamilyTheme.regular),
      onChanged: onChanged,
      keyboardType: keyboard,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CpfInputFormatter()
      ],
      decoration: InputDecoration(labelText: title,
          suffixIcon: Icon(icon,size: 15,color: const Color.fromRGBO(59, 59, 59, 0.5)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorTheme.gray)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorTheme.gray)),
          labelStyle: TextStyle(fontFamily: FamilyTheme.regular,fontSize: 14,color: ColorTheme.title)),
    );
  }
}