import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/login/register/presentation/components/register_card_widget.dart';
import 'package:marcenaria/modules/login/shared/components/login_title_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


  final String title = "Criar conta";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: ColorTheme.background,
      appBar: AppBar(backgroundColor: ColorTheme.background),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: LoginTitleWidget(title: title)),
              const SizedBox(height: 25.0),
              const RegisterCardWidget()

            ]),
      ),
    );
  }
}
