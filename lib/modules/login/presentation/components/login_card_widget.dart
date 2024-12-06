import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/login/presentation/components/login_icons.dart';
import 'package:marcenaria/modules/login/presentation/components/email_textfield_widget.dart';
import 'package:marcenaria/modules/login/presentation/components/login_navigation_text_widget.dart';
import 'package:marcenaria/modules/login/presentation/components/password_textfield_widget.dart';

class LoginCardWidget extends StatelessWidget {

  final String resetText = "Esqueceu a senha?";
  final String registerText = "Novo por aqui? Inscreva-se";

  const LoginCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: ColorTheme.gray, blurRadius: 4.0, offset: const Offset(0.0, 5.0))],
                  color: const Color(0xFFECECEC),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                  children: [
                    EmailTextFieldWidget(title: "E-mail", icon: LoginIcons.email, onChanged: (String value) {}),
                    const SizedBox(height: 15.0),
                    PasswordTextFieldWidget(title: "Senha",icon: LoginIcons.password, onChanged: (String value) {})
                  ])),
        const SizedBox(height: 10.0),
        Align(
            alignment: AlignmentDirectional.centerEnd,
            child: LoginNavigationTextWidget(title: resetText, onPressed: () {})),
        Align(
            alignment: AlignmentDirectional.centerEnd,
            child: LoginNavigationTextWidget(title: registerText, onPressed: () {}))
      ],
    );
  }
}
