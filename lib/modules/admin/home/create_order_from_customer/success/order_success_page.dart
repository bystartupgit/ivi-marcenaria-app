import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class OrderSuccessPage extends StatelessWidget {
  final String title = "Orçamento criado com sucesso!";
  final String subtitle = "Já recebemos todos os seus dados.";
  final String description =
      "Nossa equipe validará os dados enviados, se tudo estiver correto, "
      "o orçamento será processado em breve.";

  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: ColorTheme.background,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: ColorTheme.gray,
                      blurRadius: 4.0,
                      offset: const Offset(0.0, 5.0),
                    )
                  ],
                  color: const Color(0xFFECECEC),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: FamilyTheme.bold,
                        fontSize: 20,
                        color: ColorTheme.black3,
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: FamilyTheme.regular,
                        fontSize: 14,
                        color: ColorTheme.title,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: FamilyTheme.regular,
                        fontSize: 14,
                        color: ColorTheme.black3,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorTheme.orange,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Icon(
                        Icons.check,
                        color: ColorTheme.orange,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Navega para a tela principal (NavigationPage)
                    // Remove todas as rotas até chegar na NavigationPage
                    Modular.to.popUntil((route) => route.settings.name == Modular.initialRoute || route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    backgroundColor: ColorTheme.lightGray,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text(
                    "Voltar à tela principal",
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorTheme.black3,
                      fontFamily: FamilyTheme.regular,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

