import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/login/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/login/shared/components/login_icons.dart';
import 'package:marcenaria/modules/login/shared/components/email_textfield_widget.dart';
import 'package:marcenaria/modules/login/presentation/components/login_navigation_text_widget.dart';
import 'package:marcenaria/modules/login/shared/components/password_textfield_widget.dart';

class LoginCardWidget extends StatelessWidget {
  final String resetText = "Esqueceu a senha?";
  final String registerText = "Novo por aqui? Inscreva-se";

  final bool isObscure;
  final Function() changeObscure;
  final Function(String value) setEmail;
  final Function(String value) setPassword;

  const LoginCardWidget(
      {super.key,
      required this.setEmail,
      required this.setPassword,
      required this.isObscure,
      required this.changeObscure});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: ColorTheme.gray,
                      blurRadius: 4.0,
                      offset: const Offset(0.0, 5.0))
                ],
                color: const Color(0xFFECECEC),
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(children: [
              EmailTextFieldWidget(
                  title: "E-mail", icon: LoginIcons.email, onChanged: setEmail),
              const SizedBox(height: 15.0),
              PasswordTextFieldWidget(
                  title: "Senha",
                  changeObscure: changeObscure,
                  isObscure: isObscure,
                  icon: LoginIcons.password,
                  onChanged: setPassword)
            ])),
        const SizedBox(height: 10.0),
        Align(
            alignment: AlignmentDirectional.centerEnd,
            child: LoginNavigationTextWidget(
                title: resetText,
                onPressed: () =>
                    Modular.to.pushNamed(RouterMapper.resetPasswordIntern))),
        Align(
            alignment: AlignmentDirectional.centerEnd,
            child: LoginNavigationTextWidget(
                title: registerText,
                onPressed: () =>
                    Modular.to.pushNamed(RouterMapper.registerIntern)))
      ],
    );
  }
}
