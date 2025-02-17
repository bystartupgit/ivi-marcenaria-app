import 'package:flutter/material.dart';

import '../../../../../../../core/themes/color_theme.dart';
import '../../../../../../../core/themes/family_theme.dart';

class CreateProporseCustomerButtonWidget extends StatelessWidget {

  final String title = "Conversar com Cliente";
  final Function() onPressed;

  final double size;

  const CreateProporseCustomerButtonWidget({super.key, required this.size, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 3,
        child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: ColorTheme.orange,
              borderRadius: BorderRadius.circular(5.0)
            ),
            child: Text(title,style: TextStyle(fontSize: size,fontFamily: FamilyTheme.regular, color: Colors.white ))),
      ),
    );
  }
}