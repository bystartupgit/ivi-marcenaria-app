import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/onboarding/presentation/components/onboarding_icons.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../../../core/themes/family_theme.dart';
import '../../../data/routers/customer_routers.dart';

class OrderHeaderGreatingsWidget extends StatelessWidget {
  final String title = "Novos projetos aguardam por você";

  const OrderHeaderGreatingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed(CustomerRouters.serviceIntern),
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
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
