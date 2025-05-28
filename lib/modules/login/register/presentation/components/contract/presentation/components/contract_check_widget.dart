import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class ContractCheckWidget extends StatelessWidget {
  final bool value;
  final Function(bool? value) onChanged;

  final String title = "Concordar com termos e contrato";

  const ContractCheckWidget(
      {super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                  value: value,
                  onChanged: onChanged,
                  side: const BorderSide(color: Color(0xFF898989)),
                  fillColor:
                      const WidgetStatePropertyAll<Color>(Color(0xFFD9D9D9)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)))),
          const SizedBox(width: 5.0),
          Text(title,
              style: TextStyle(
                  fontFamily: FamilyTheme.khula,
                  color: ColorTheme.title,
                  fontSize: 14))
        ]);
  }
}
