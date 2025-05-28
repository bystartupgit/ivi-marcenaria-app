import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CpfInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String value = newValue.text;

    value = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (value.length > 11) {
      value = value.substring(0, 11);
    }

    String textFormatted = '';

    if (value.length > 9) {
      textFormatted =
          '${value.substring(0, 3)}.${value.substring(3, 6)}.${value.substring(6, 9)}-${value.substring(9)}';
    } else if (value.length > 6) {
      textFormatted =
          '${value.substring(0, 3)}.${value.substring(3, 6)}.${value.substring(6)}';
    } else if (value.length > 3) {
      textFormatted = '${value.substring(0, 3)}.${value.substring(3)}';
    } else {
      textFormatted = value;
    }

    return TextEditingValue(
      text: textFormatted,
      selection: TextSelection.collapsed(offset: textFormatted.length),
    );
  }
}
