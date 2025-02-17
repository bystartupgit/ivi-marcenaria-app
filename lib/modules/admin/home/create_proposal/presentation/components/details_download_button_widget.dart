import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/themes/color_theme.dart';
import '../../../../../../../core/themes/family_theme.dart';

class DetailsDownloadButtonWidget extends StatelessWidget {

  final Function() download;

  final String image = "assets/login/svgs/download.svg";
  final String title = "Downloads Anexos";

  const DetailsDownloadButtonWidget({ super.key, required this.download });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: ColorTheme.orange
      ),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(image,colorFilter: const ColorFilter.mode( Colors.white, BlendMode.srcIn)),
            const SizedBox(width: 5.0),
            Text(title,style: TextStyle(fontFamily: FamilyTheme.regular,
                color: Colors.white, fontSize: 12))
          ]),
    );
  }
}