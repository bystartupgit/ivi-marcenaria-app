import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/login/reset_password/reset_code/store/reset_code_store.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../core/themes/color_theme.dart';
import '../../../../core/themes/family_theme.dart';

class ResetCodePage extends StatelessWidget {
  final ResetCodeStore store = Modular.get<ResetCodeStore>();

  final String title = "Código de verificação";
  final String subtitle = "Enviamos um código para seu e-mail "
      "digite-o para prosseguir com redefinição.";

  final buttonTitle = "Continuar";

  ResetCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return ModalProgressHUD(
        inAsyncCall: store.loading,
        child: Scaffold(
          backgroundColor: ColorTheme.background,
          appBar: AppBar(
              backgroundColor: ColorTheme.background,
              leading: IconButton(
                  onPressed: () => Modular.to.pop(),
                  icon: Icon(Icons.arrow_back_ios_new_rounded,
                      color: ColorTheme.black2))),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(title,
                      style: TextStyle(
                        fontFamily: FamilyTheme.medium,
                        color: ColorTheme.black3,
                        fontSize: 24,
                      )),
                  const SizedBox(height: 20.0),
                  Text(subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: FamilyTheme.light,
                        color: ColorTheme.black3,
                        fontSize: 16,
                      )),
                  const SizedBox(height: 20.0),
                  PinCodeTextField(
                    enableActiveFill: true,
                    onChanged: store.setCode,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      selectedColor: Colors.white,
                      borderWidth: 0,
                      inactiveBorderWidth: 0,
                      activeBorderWidth: 0,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 60,
                      fieldWidth: 50,
                    ),
                    appContext: context,
                    length: 6,
                  ),
                  const SizedBox(height: 40.0),
                  ElevatedButton(
                      onPressed: store.codeComplete
                          ? () => store.sendEmailReset(context: context)
                          : null,
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          backgroundColor: ColorTheme.orange),
                      child: Text(buttonTitle,
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontFamily: FamilyTheme.regular)))
                ]),
          ),
        ),
      );
    });
  }
}
