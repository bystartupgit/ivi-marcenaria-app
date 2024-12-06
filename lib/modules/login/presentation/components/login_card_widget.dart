import 'package:flutter/material.dart';
import 'package:marcenaria/modules/login/presentation/components/login_icons.dart';
import 'package:marcenaria/modules/login/presentation/components/email_textfield_widget.dart';
import 'package:marcenaria/modules/login/presentation/components/password_textfield_widget.dart';

class LoginCardWidget extends StatelessWidget {
  const LoginCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
          child: Column(
              children: [
                EmailTextFieldWidget(title: "E-mail", icon: LoginIcons.email, onChanged: (String value) {}),
                const SizedBox(height: 15.0),
                PasswordTextFieldWidget(title: "Senha",icon: LoginIcons.password, onChanged: (String value) {})

              ]),
        )
    );
  }
}
