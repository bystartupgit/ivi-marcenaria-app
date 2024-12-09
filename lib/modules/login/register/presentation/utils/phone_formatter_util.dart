

import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue ) {


    String onlyNumbers = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (onlyNumbers.length > 11) { onlyNumbers = onlyNumbers.substring(0, 11); }

    String formatted = _applyMask(onlyNumbers);

    return TextEditingValue(text: formatted, selection: TextSelection.collapsed(offset: formatted.length));
  }

  String _applyMask(String input) {
    if (input.isEmpty) return input;

    if (input.length <= 2) {
      return '($input';
    } else if (input.length <= 7) {
      return '(${input.substring(0, 2)}) ${input.substring(2)}';
    } else {
      return '(${input.substring(0, 2)}) ${input.substring(2, 7)}-${input.substring(7)}';
    }
  }
}