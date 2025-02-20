import 'package:flutter/material.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class HomeCardWidget extends StatelessWidget {

  final Function() onPressed;

  final IconData icon;
  final String title;

  const HomeCardWidget({super.key, required this.title, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        color: ColorTheme.lightGray,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            spacing: 10.0,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(icon,size: 25),
              Text(title,
                  style: TextStyle(fontFamily: FamilyTheme.medium,
                      color: ColorTheme.black3, fontSize: 12))
            ],
          ),
        ),
      ),
    );
  }
}
