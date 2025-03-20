import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class ProfileAttachmentButtonWidget extends StatelessWidget {

  final String image = "assets/admin/navigation/clip.svg";
  final String title = "Anexar";

  final Function() download;

  const ProfileAttachmentButtonWidget({super.key, required this.download});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: download,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 2.0),
        decoration: BoxDecoration(
          color: ColorTheme.orange,
          borderRadius: BorderRadius.circular(5.0)
        ),
        child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(image),
              const SizedBox(width: 5.0),
              Text(title,style: TextStyle(fontFamily: FamilyTheme.regular,
                  color: Colors.white, fontSize: 12))
            ]),
      ),
    );
  }
}
