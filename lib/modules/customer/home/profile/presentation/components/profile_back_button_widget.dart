import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';

class ProfileBackButtonWidget extends StatelessWidget {
  const ProfileBackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => Modular.to.pop(),
        icon: Icon(Icons.arrow_back_ios_new_rounded, color: ColorTheme.black2));
  }
}
