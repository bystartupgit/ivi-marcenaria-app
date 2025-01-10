import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class NavigationDrawerOptionWidget extends StatelessWidget {

  final IconData icon;
  final Function() onPressed;
  final String title;

  const NavigationDrawerOptionWidget({super.key,
    required this.icon,
    required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
          spacing: 10.0,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(title,style: TextStyle(color: ColorTheme.black3, fontFamily: FamilyTheme.regular, fontSize: 20)),
            Icon(icon,color: ColorTheme.black3),
            const SizedBox(width: 10.0)
          ]),
    );
  }
}
