import 'package:flutter/material.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class CreateProporseButtonWidget extends StatelessWidget {

  final Function() onPressed;
  final String title = "Confirmar e enviar Orçamento";

  const CreateProporseButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 3,
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: ColorTheme.green
          ),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5.0,
              children: [
                Text(title,style: TextStyle(fontFamily: FamilyTheme.regular, color: Colors.white, fontSize: 12))
              ]),
        ),
      ),
    );
  }
}
