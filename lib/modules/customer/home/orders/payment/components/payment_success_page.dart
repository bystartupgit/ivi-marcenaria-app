import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';
import '../../../../../onboarding/presentation/components/onboarding_icons.dart';

class PaymentSuccessPage extends StatelessWidget {
  final String title = "Seu pedido foi aprovado com sucesso!";
  final String subtitle =
      "Enviaremos o link de pagamento por e-mail. Assim que o pagamento for confirmado, você será notificado,"
      " e iniciaremos a produção do seu projeto.";

  final String buttonTitle = "Solicitar novo orçamento";

  final String image = "assets/login/images/check.png";

  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
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
            const SizedBox(height: 20.0),
            Text(subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: FamilyTheme.regular,
                    fontSize: 14,
                    color: ColorTheme.title)),
            const SizedBox(height: 40.0),
            Image.asset(image, width: MediaQuery.of(context).size.width * 0.25),
            const Expanded(child: SizedBox()),
            InkWell(
              onTap: () => Modular.to
                  .popUntil(ModalRoute.withName(Modular.initialRoute)),
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: ColorTheme.orange),
                  child: Row(
                      spacing: 10.0,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(OnboardingIcons.plus,
                            color: Colors.white, size: 20.0),
                        Text(buttonTitle,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: FamilyTheme.medium,
                                fontSize: 14))
                      ])),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 40.0)
          ]),
        ),
      ),
    );
  }
}
