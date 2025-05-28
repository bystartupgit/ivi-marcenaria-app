import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../../../core/themes/color_theme.dart';
import '../../../../../../../../core/themes/family_theme.dart';
import '../../../../../../../admin/shared/chat_order_button/confirmation_button_widget.dart';

class AprovalProposalSuccessPage extends StatelessWidget {
  final String title = "Proposta foi aceita com sucesso!";
  final String subtitle =
      "O suporte está finalizando os últimos detalhes com o cliente. "
      "Assim que tudo estiver aprovado, você será notificado para iniciar a produção do projeto. Caso tenha dúvidas sobre a execução, não hesite em entrar em contato conosco. Estamos à disposição para ajudar!";

  final String buttonTitle = "Voltar a tela inicial";

  final String image = "assets/login/images/check.png";

  const AprovalProposalSuccessPage({super.key});

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
            const SizedBox(height: 30.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
              child: ConfirmationButtonWidget(
                title: buttonTitle,
                size: 12,
                onPressed: () => Modular.to
                    .popUntil(ModalRoute.withName(Modular.initialRoute)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).padding.bottom + 40.0)
          ]),
        ),
      ),
    );
  }
}
