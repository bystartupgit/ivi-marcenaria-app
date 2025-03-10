import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/login/reset_password/confirm_password/stores/confirm_password_store.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/themes/color_theme.dart';
import '../../../../core/themes/family_theme.dart';
import '../../shared/components/login_icons.dart';
import '../../shared/components/password_textfield_widget.dart';

class ConfirmPasswordPage extends StatelessWidget {

  final ConfirmPasswordStore store = Modular.get<ConfirmPasswordStore>();

  final String title = "Crie uma nova senha";
  final String buttonTitle = "Redefinir senha";

  final String token;

  ConfirmPasswordPage({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) {
          return ModalProgressHUD(
            inAsyncCall: store.loading,
            child: Scaffold(
              backgroundColor: ColorTheme.background,
              appBar: AppBar(
                  backgroundColor: ColorTheme.background,
                  leading: IconButton(onPressed: () => Modular.to.pop(),
                      icon: Icon(Icons.arrow_back_ios_new_rounded,color: ColorTheme.black2))),
              body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(title, style: TextStyle(fontFamily: FamilyTheme.medium,
                        color: ColorTheme.black3, fontSize: 24,)),
                      const SizedBox(height: 20.0),
                      Container(
                          padding: const EdgeInsets.only(right: 10, left: 10.0, top: 5.0, bottom: 10.0),
                          decoration: BoxDecoration(
                              boxShadow: [BoxShadow(color: ColorTheme.gray, blurRadius: 4.0, offset: const Offset(0.0, 5.0))],
                              color: const Color(0xFFECECEC),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Column(children: [
                            PasswordTextFieldWidget(title: "Nova Senha",icon: LoginIcons.password, onChanged: store.setPassword),
                            const SizedBox(height: 15.0),
                            PasswordTextFieldWidget(title: "Digite novamente",icon: LoginIcons.password, onChanged: store.setConfirmPassword),
                          ])),
                      const SizedBox(height: 40.0),
                      ElevatedButton(
                          onPressed: store.passwordValid? () => store.confirmationPassword(context: context,code: token) : null,
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                              backgroundColor: ColorTheme.orange),
                          child: Text(buttonTitle,style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: FamilyTheme.regular)))
                    ]),
              ),
            ),
          );
        }
    );
  }
}
