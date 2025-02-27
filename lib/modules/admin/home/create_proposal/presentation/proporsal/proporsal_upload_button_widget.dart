import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class ProporsalUploadButtonWidget extends StatelessWidget {

  final Function() onPressed;

  final String title = "Anexar orçamento";
  final String image = "assets/login/svgs/upload.svg";

  const ProporsalUploadButtonWidget({super.key, required this.onPressed});

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
            child: Center(child: Text(title,style: TextStyle(fontSize: 12,fontFamily: FamilyTheme.regular, color: Colors.white )))),
      ),
    );
  }
}
