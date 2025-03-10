import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/onboarding/presentation/components/onboarding_page_one_widget.dart';
import 'package:marcenaria/modules/onboarding/presentation/components/onboarding_page_three_widget.dart';
import 'package:marcenaria/modules/onboarding/presentation/components/onboarding_page_two_widget.dart';
import 'package:marcenaria/modules/onboarding/presentation/stores/onboarding_store.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {

  final OnboardingStore store = Modular.get<OnboardingStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          PageView(
            controller: store.controller,

            children:
            const [
               OnboardingPageOneWidget(),
               OnboardingPageTwoWidget(),
               OnboardingPageThreeWidget()
            ]),
        ],
      ));
  }
}
