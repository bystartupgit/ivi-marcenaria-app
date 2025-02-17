import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class CreateProporseNumberParcelsWidget extends StatelessWidget {

  final String title = "Nº Parcelas e valor:";

  final Function(String value) numberParcel;
  final Function(String value) value;

  const CreateProporseNumberParcelsWidget({super.key, required this.numberParcel, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
        spacing: 5.0,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: TextStyle(color: ColorTheme.black3,fontFamily: FamilyTheme.medium,fontSize: 10)),
          Row(
            spacing: 2,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 40,
                child: TextField(
                    style: TextStyle(color: ColorTheme.black3,
                        fontSize: 12,
                        fontFamily: FamilyTheme.regular),
                    onChanged: value,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorTheme.search,
                        counterText: null,
                        counter: null,
                        counterStyle: TextStyle(fontFamily: FamilyTheme.regular,color: ColorTheme.description,fontSize: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: ColorTheme.search)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: ColorTheme.search)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: ColorTheme.search)))),
              ),
              Text("de",style: TextStyle(color: ColorTheme.black3,fontFamily: FamilyTheme.medium,fontSize: 12)),
              Expanded(
                child: TextField(
                    style: TextStyle(color: ColorTheme.black3,
                        fontSize: 12,
                        fontFamily: FamilyTheme.regular),
                    onChanged: value,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      _CurrencyInputFormatter()
                    ],
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: ColorTheme.search,
                        counterStyle: TextStyle(fontFamily: FamilyTheme.regular,color: ColorTheme.description,fontSize: 10),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: ColorTheme.search)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: ColorTheme.search)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(
                                color: ColorTheme.search)))),
              ),
            ],
          ),

        ]);
  }
}

class _CurrencyInputFormatter extends TextInputFormatter {
  final NumberFormat _currencyFormat = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: '',
    decimalDigits: 2,
  );

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String text = newValue.text.replaceAll(RegExp(r'[^0-9]'), ''); // Remove tudo que não é número
    if (text.isEmpty) return newValue;

    double value = double.tryParse(text) ?? 0;
    String formatted = _currencyFormat.format(value / 100); // Divide por 100 para formatar como real

    return newValue.copyWith(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
