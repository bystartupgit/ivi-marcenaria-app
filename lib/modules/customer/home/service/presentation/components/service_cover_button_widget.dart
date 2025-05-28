import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';

import '../../../../../onboarding/presentation/components/onboarding_icons.dart';

class ServiceCoverButtonWidget extends StatelessWidget {
  final Function() onPressed;

  const ServiceCoverButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
            color: ColorTheme.orange, borderRadius: BorderRadius.circular(5.0)),
        child: const Icon(OnboardingIcons.plus, color: Colors.white),
      ),
    );
  }
}
