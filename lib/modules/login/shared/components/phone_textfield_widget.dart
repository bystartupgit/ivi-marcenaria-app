import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/login/register/presentation/utils/phone_formatter_util.dart';

class PhoneTextFieldWidget extends StatelessWidget {

  final String title;
  final String description = "(DDD) Numero";
  final IconData icon;

  final Function(String value) onChanged;
  final TextInputType keyboard;

  const PhoneTextFieldWidget({super.key,required this.title,
    required this.onChanged,
    this.icon = Icons.add, this.keyboard = TextInputType.text });

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: ColorTheme.gray,fontSize: 16,fontFamily: FamilyTheme.regular),
      onChanged: onChanged,
      keyboardType: keyboard,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        PhoneNumberFormatter()
      ],
      decoration: InputDecoration(
          suffixIcon: Icon(icon,size: 15,color: const Color.fromRGBO(59, 59, 59, 0.5)),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorTheme.gray)),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: ColorTheme.gray)),
          hintText: description,
          hintStyle: TextStyle(fontFamily: FamilyTheme.regular,fontSize: 16,color: ColorTheme.description),
          labelText: title,
          labelStyle: TextStyle(fontFamily: FamilyTheme.regular,fontSize: 14,color: ColorTheme.title)),
    );
  }
}