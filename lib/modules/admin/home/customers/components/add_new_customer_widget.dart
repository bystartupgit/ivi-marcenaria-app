import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../../../core/themes/family_theme.dart';
import '../../../../onboarding/presentation/components/onboarding_icons.dart';

class AddNewCustomerWidget extends StatelessWidget {
  final Function() onPressed;
  final String title = "Adicionar novo Cliente";

  const AddNewCustomerWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: ColorTheme.orange),
          child: Row(
              spacing: 10.0,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(OnboardingIcons.plus,
                    color: Colors.white, size: 20.0),
                Text(title,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: FamilyTheme.medium,
                        fontSize: 14))
              ])),
    );
  }
}
