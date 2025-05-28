import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/login/reset_password/stores/reset_password_store.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../core/themes/color_theme.dart';
import '../../../core/themes/family_theme.dart';
import '../shared/components/email_textfield_widget.dart';
import '../shared/components/login_icons.dart';

class ResetPasswordPage extends StatelessWidget {
  final ResetPasswordStore store = Modular.get<ResetPasswordStore>();

  final String title = "Esqueceu a senha?";
  final String subtitle = "Digite o e-mail que deseja redefinir a "
      "senha para que enviemos um código de validação.";

  final buttonTitle = "Redefinir senha";

  ResetPasswordPage({super.key});

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
                  Container(
                      padding: const EdgeInsets.only(
                          right: 10, left: 10.0, top: 5.0, bottom: 10.0),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: ColorTheme.gray,
                                blurRadius: 4.0,
                                offset: const Offset(0.0, 5.0))
                          ],
                          color: const Color(0xFFECECEC),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: EmailTextFieldWidget(
                          title: "E-mail",
                          icon: LoginIcons.email,
                          onChanged: store.setEmail)),
                  const SizedBox(height: 40.0),
                  ElevatedButton(
                      onPressed: store.emailNotEmpty
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
