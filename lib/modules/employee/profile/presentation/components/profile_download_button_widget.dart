import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/employee/profile/presentation/components/profile_icons.dart';

class ProfileDownloadButtonWidget extends StatelessWidget {

  final String title = "Download";

  const ProfileDownloadButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 2.0,horizontal: 5.0),
        margin: const EdgeInsets.only(right: 5.0),
        decoration: BoxDecoration(color: ColorTheme.lightGray,
            border: Border.all(color: ColorTheme.orange),
            borderRadius: BorderRadius.circular(5.0)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: 3.0,
          children: [
            Icon(ProfileIcons.download,color: ColorTheme.orange,size: 12),
            Text(title,style: TextStyle(color: ColorTheme.orange,fontFamily: FamilyTheme.regular,fontSize: 10))
          ],
        ));
  }
}
