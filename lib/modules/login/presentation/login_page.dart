import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marcenaria/core/data/router_global_mapper.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/login/presentation/components/login_button_widget.dart';
import 'package:marcenaria/modules/login/presentation/components/login_card_widget.dart';
import 'package:marcenaria/modules/login/presentation/components/login_greetings_widget.dart';
import 'package:marcenaria/modules/login/presentation/stores/login_store.dart';
import 'package:marcenaria/modules/login/shared/components/login_title_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../core/themes/family_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String title = "Login";
  final String logo = "assets/logo/logo.svg";

  final LoginStore store = Modular.get<LoginStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => ModalProgressHUD(
        inAsyncCall: store.loading,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorTheme.background,
          body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      logo,
                      width: MediaQuery.of(context).size.width * 0.45,
                    ),
                    const SizedBox(height: 10.0),
                    Text("IVI",
                        style: TextStyle(
                            fontFamily: FamilyTheme.regular,
                            fontSize: 20,
                            color: const Color(0xFF545253))),
                    const LoginGreetingsWidget(),
                    const SizedBox(height: 30.0),
                    LoginTitleWidget(title: title),
                    const SizedBox(height: 25.0),
                    LoginCardWidget(
                        setEmail: store.setEmail,
                        setPassword: store.setPassword,
                        isObscure: store.isObscure,
                        changeObscure: () => store.changeObscure()),
                    const SizedBox(height: 40.0),
                    LoginButtonWidget(
                        onPress: () => store.login(context: context))
                  ])),
        ),
      ),
    );
  }
}
