import 'package:flutter/material.dart';

import '../../../../core/themes/color_theme.dart';
import '../../../../core/themes/family_theme.dart';
import 'onboarding_icons.dart';

class OnboardingButtonWidget extends StatelessWidget {
  final String description;

  const OnboardingButtonWidget({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 2.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: ColorTheme.orange),
        child: Row(spacing: 10.0, mainAxisSize: MainAxisSize.min, children: [
          const Icon(OnboardingIcons.plus, color: Colors.white, size: 20.0),
          Text(description,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: FamilyTheme.medium,
                  fontSize: 20))
        ]));
  }
}
