import 'package:flutter/material.dart';

import '../../../../../../../core/themes/family_theme.dart';
import 'details_icons.dart';

class DetailsCancelButtonWidget extends StatelessWidget {

  final String title = "Cancelar proposta";

  final Function() onPressed;

  final double iconSize;
  final double size;

  const DetailsCancelButtonWidget({super.key, required this.onPressed,
    required this.iconSize, required this.size});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onPressed,
        child: Container(
            padding: const EdgeInsets.all(7.0),
            decoration: BoxDecoration(
                border:  Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(5.0)
            ),
        child: Row(
          spacing: 5.0,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(DetailsIcons.delete, color: Colors.red, size: iconSize),
            Text(title,style: TextStyle(fontSize: size,fontFamily:
            FamilyTheme.regular, color: Colors.red )),
          ],
        )));
  }
}