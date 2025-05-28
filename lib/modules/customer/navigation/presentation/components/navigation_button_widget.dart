import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class NavigationButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool selected;
  final Function() onPress;

  const NavigationButtonWidget(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPress,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon,
                  color: selected ? ColorTheme.orange : ColorTheme.title),
              const SizedBox(height: 5.0),
              Text(title,
                  style: TextStyle(
                      color: selected ? ColorTheme.orange : ColorTheme.title,
                      fontFamily: selected
                          ? FamilyTheme.regularItalic
                          : FamilyTheme.regular,
                      fontSize: 12))
            ],
          ),
        ));
  }
}
