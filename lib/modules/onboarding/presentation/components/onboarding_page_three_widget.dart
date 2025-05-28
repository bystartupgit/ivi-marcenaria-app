import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/data/router_global_mapper.dart';
import '../../../../core/themes/color_theme.dart';
import '../../../../core/themes/family_theme.dart';
import '../../domain/mappers/onboarding_mapper.dart';
import 'onboarding_button_widget.dart';

class OnboardingPageThreeWidget extends StatelessWidget {
  const OnboardingPageThreeWidget({super.key});

  final String button = "Entrar";
  final String image = "assets/onboarding/onboarding_3.png";
  final String title = "Junte-se a nós e ofereça aos nossos clientes.";
  final String logo = "assets/logo/logo.svg";
  final String description = "Seja um prestador";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(image)))),
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: AlignmentDirectional.centerEnd,
                    end: AlignmentDirectional.centerStart,
                    stops: [0, 100],
                    colors: [Color(0xFFECB157), Color(0x00000000)]))),
        Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const Expanded(child: SizedBox()),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SvgPicture.asset(logo, height: 150),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Text(title,
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: FamilyTheme.regular,
                                  color: Colors.white))),
                      SizedBox(
                        height: 45,
                        child: AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              FadeAnimatedText(OnboardingMapper.oc1,
                                  textStyle: TextStyle(
                                      fontSize: 36,
                                      fontFamily: FamilyTheme.medium,
                                      color: Colors.white)),
                              FadeAnimatedText(OnboardingMapper.oc2,
                                  textStyle: TextStyle(
                                      fontSize: 36,
                                      fontFamily: FamilyTheme.medium,
                                      color: Colors.white)),
                              FadeAnimatedText(OnboardingMapper.oc3,
                                  textStyle: TextStyle(
                                      fontSize: 36,
                                      fontFamily: FamilyTheme.medium,
                                      color: Colors.white)),
                            ]),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1),
                      Center(
                          child: DotsIndicator(
                              dotsCount: 3,
                              position: 2,
                              decorator: DotsDecorator(
                                  activeColor: ColorTheme.orange,
                                  color: ColorTheme.background,
                                  activeSize: const Size(15.0, 15.0),
                                  size: const Size(15.0, 15.0)))),
                      const SizedBox(height: 20.0),
                      Center(
                          child:
                              OnboardingButtonWidget(description: description))
                    ],
                  ),
                ),
              ],
            )),
        Positioned(
            right: 0,
            top: MediaQuery.of(context).padding.top + 30.0,
            child: TextButton(
                onPressed: () =>
                    Modular.to.pushReplacementNamed(RouterGlobalMapper.login),
                child: Text(button,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: FamilyTheme.regular,
                        fontSize: 16))))
      ],
    );
  }
}
