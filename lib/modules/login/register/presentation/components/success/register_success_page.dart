import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class RegisterSuccessPage extends StatelessWidget {
  final String title = "Dados enviados com sucesso!";
  final String subtitle = "Já Recebemos todos os seus dados.";

  final String description =
      "Nossa equipe validará os dados enviados, se tudo estiver correto, "
      "sua conta será ativada em breve, pronta para receber solicitações \nde serviço na plataforma.";

  final String image = "assets/login/images/check.png";

  const RegisterSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: ColorTheme.background,
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(mainAxisSize: MainAxisSize.max, children: [
                SizedBox(height: MediaQuery.of(context).padding.top + 40.0),
                Text(title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: FamilyTheme.medium,
                        fontSize: 24,
                        color: ColorTheme.title)),
                const SizedBox(height: 15.0),
                Text(subtitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: FamilyTheme.regular,
                        fontSize: 12,
                        color: ColorTheme.title)),
                const SizedBox(height: 20.0),
                Text(description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: FamilyTheme.regular,
                        fontSize: 14,
                        color: ColorTheme.title)),
                const SizedBox(height: 40.0),
                Image.asset(image,
                    width: MediaQuery.of(context).size.width * 0.25),
                const Expanded(child: SizedBox()),
                ElevatedButton(
                    onPressed: () => Modular.to
                        .popUntil(ModalRoute.withName(Modular.initialRoute)),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        backgroundColor: ColorTheme.title.withOpacity(0.1)),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Voltar a tela de Login",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontFamily: FamilyTheme.regular)))),
                SizedBox(height: MediaQuery.of(context).padding.bottom + 40.0)
              ]),
            )));
  }
}
