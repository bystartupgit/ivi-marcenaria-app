import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';

class DetailsBackButtonWidget extends StatelessWidget {
  const DetailsBackButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () => Modular.to.pop(), icon: Icon(Icons.arrow_back_ios_new_rounded,color: ColorTheme.black2));
  }
}
