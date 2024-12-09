import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/login/shared/components/document_textfield_widget.dart';
import 'package:marcenaria/modules/login/shared/components/email_textfield_widget.dart';
import 'package:marcenaria/modules/login/shared/components/login_icons.dart';
import 'package:marcenaria/modules/login/shared/components/name_textfield_widget.dart';
import 'package:marcenaria/modules/login/shared/components/password_textfield_widget.dart';
import 'package:marcenaria/modules/login/shared/components/phone_textfield_widget.dart';

class RegisterCardWidget extends StatelessWidget {

  final String description = "Informações para contato";

  const RegisterCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(description,style: TextStyle(fontSize: 10,fontFamily: FamilyTheme.regular,color: ColorTheme.title)),
        const SizedBox(height: 10.0),
        Container(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
            decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: ColorTheme.gray, blurRadius: 4.0, offset: const Offset(0.0, 5.0))],
                color: const Color(0xFFECECEC),
                borderRadius: BorderRadius.circular(10.0)),
            child: Column(
                children: [
                  NameTextFieldWidget(title: "Nome", icon: LoginIcons.user ,onChanged: (String value) {},),
                  const SizedBox(height: 15.0),
                  EmailTextFieldWidget(title: "E-mail", icon: LoginIcons.email, onChanged: (String value) {}),
                  const SizedBox(height: 15.0),
                  PasswordTextFieldWidget(title: "Senha",icon: LoginIcons.password, onChanged: (String value) {}),
                  const SizedBox(height: 15.0),
                  DocumentTextFieldWidget(title: "Documento", icon: LoginIcons.cpf, onChanged: (String value) {}),
                  const SizedBox(height: 15.0),
                  PhoneTextFieldWidget(title: "Telefone", icon: LoginIcons.whatsapp, onChanged: (String value) {}),
                  const SizedBox(height: 10.0),
                ])),
      ]);
  }
}
