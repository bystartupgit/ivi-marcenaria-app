import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class ProporsalDownloadButtonWidget extends StatelessWidget {

  final String title = "Download do Orçamento";
  final Function() onPressed;

  final String image = "assets/login/svgs/download.svg";

  const ProporsalDownloadButtonWidget({super.key, required this.onPressed});

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
            child: Row(
              spacing: 10.0,
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(image, colorFilter: const ColorFilter.mode( Colors.white, BlendMode.srcIn)),
                Text(title,style: TextStyle(fontSize: 12,fontFamily: FamilyTheme.regular, color: Colors.white )),
              ],
            )),
      ),
    );
  }
}
