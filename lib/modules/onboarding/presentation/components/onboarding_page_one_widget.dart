import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/router_global_mapper.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/onboarding/domain/mappers/onboarding_mapper.dart';

class OnboardingPageOneWidget extends StatelessWidget {

  final String button = "Entrar";
  final String image = "assets/onboarding/onboarding_1.png";
  final String title = "Transforme seu espaço com um projeto de marcenaria";
  final String description = "Solicitar orçamento";

  const OnboardingPageOneWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height:  MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(image)))),
        Container(
            height:  MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration( gradient: LinearGradient(
                begin: AlignmentDirectional.centerEnd,
                end: AlignmentDirectional.centerStart,
                stops: [0, 100],
                colors: [Color(0xFFECB157),Color(0x00000000)]))),
        Container(
          width:  MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const Expanded(child: SizedBox()),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(title,
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 24,fontFamily: FamilyTheme.regular,color: Colors.white))),
                    SizedBox(
                      height: 45,
                      child: AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          FadeAnimatedText(OnboardingMapper.oa1, textStyle: TextStyle(fontSize: 36,fontFamily: FamilyTheme.medium,color: Colors.white)),
                          FadeAnimatedText(OnboardingMapper.oa2, textStyle: TextStyle(fontSize: 36,fontFamily: FamilyTheme.medium,color: Colors.white)),
                          FadeAnimatedText(OnboardingMapper.oa3, textStyle: TextStyle(fontSize: 36,fontFamily: FamilyTheme.medium,color: Colors.white)),
                        ]),
                    ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    Center(child: DotsIndicator(dotsCount: 3,
                        position: 0,
                        decorator: DotsDecorator(

                            activeColor: ColorTheme.orange,
                            color: ColorTheme.background,
                            activeSize: const Size(15.0, 15.0),
                            size: const Size(15.0, 15.0)))),
                    const SizedBox(height: 20.0),
                    Center(
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 2.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: ColorTheme.orange),
                          child: Text(description,style: TextStyle(color: Colors.white,fontFamily: FamilyTheme.medium,fontSize: 20)),
                      ))
                  ],
                ),
              ),
            ],
          )),
        Positioned(
            right: 0,
            top: MediaQuery.of(context).padding.top + 30.0,
            child: TextButton(onPressed: () => Modular.to.pushReplacementNamed(RouterGlobalMapper.login),
                child: Text(button,style: TextStyle(color: Colors.white,fontFamily: FamilyTheme.regular,fontSize: 16))))
      ],
    );
  }
}
