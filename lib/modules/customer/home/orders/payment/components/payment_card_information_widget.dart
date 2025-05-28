import 'package:flutter/material.dart';
import 'package:marcenaria/modules/customer/home/orders/payment/components/payment_finish_button_widget.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class PaymentCardInformationWidget extends StatelessWidget {
  final String title = "Seleciona a forma de pagamento";
  final String subtitle = "Utilize o campo personalizado caso você escolha dar "
      "uma entrada e parcelar o restante, conforme o orçamento na tela anterior.";

  final int? option;
  final bool hasOption;
  final Function(int? value) setOption;
  final Function() onPressed;

  const PaymentCardInformationWidget(
      {super.key,
      required this.onPressed,
      required this.hasOption,
      required this.option,
      required this.setOption});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: ColorTheme.lightGray,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: TextStyle(
                    fontFamily: FamilyTheme.medium,
                    color: ColorTheme.black3,
                    fontSize: 18,
                  )),
              Text(subtitle,
                  style: TextStyle(
                    fontFamily: FamilyTheme.light,
                    color: ColorTheme.black3,
                    fontSize: 12,
                  )),
              ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 0,
                title: Text('A vista - PIX',
                    style: TextStyle(
                      fontFamily: FamilyTheme.regular,
                      color: ColorTheme.black3,
                      fontSize: 12,
                    )),
                leading: Radio<int>(
                  activeColor: ColorTheme.orange,
                  value: 0,
                  groupValue: option,
                  onChanged: setOption,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 0,
                title: Text('Cartão de Credito - Parcelar',
                    style: TextStyle(
                      fontFamily: FamilyTheme.regular,
                      color: ColorTheme.black3,
                      fontSize: 12,
                    )),
                leading: Radio<int>(
                  activeColor: ColorTheme.orange,
                  value: 1,
                  groupValue: option,
                  onChanged: setOption,
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                horizontalTitleGap: 0,
                title: Text('Entrada + Parcelamento',
                    style: TextStyle(
                      fontFamily: FamilyTheme.regular,
                      color: ColorTheme.black3,
                      fontSize: 12,
                    )),
                leading: Radio<int>(
                  activeColor: ColorTheme.orange,
                  value: 2,
                  groupValue: option,
                  onChanged: setOption,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.4,
              ),
              Center(
                  child: PaymentFinishButtonWidget(
                      onPressed: hasOption ? onPressed : null))
            ]),
      ),
    );
  }
}
