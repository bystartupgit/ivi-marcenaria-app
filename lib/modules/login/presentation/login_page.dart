import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/login/presentation/components/login_button_widget.dart';
import 'package:marcenaria/modules/login/presentation/components/login_card_widget.dart';
import 'package:marcenaria/modules/login/presentation/components/login_greetings_widget.dart';
import 'package:marcenaria/modules/login/shared/components/login_title_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final String title = "Login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorTheme.background,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LoginGreetingsWidget(),
                const SizedBox(height: 30.0),
                LoginTitleWidget(title: title),
                const SizedBox(height: 25.0),
                const LoginCardWidget(),
                const SizedBox(height: 40.0),
                LoginButtonWidget(onPress: () {})
              ]
          )),
    );
  }
}
