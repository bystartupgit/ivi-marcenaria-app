import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class ContractDownloadWidget extends StatelessWidget {

  final Function() download;

  final String image = "assets/login/svgs/download.svg";
  final String title = "Download do contrato de PS";

  const ContractDownloadWidget({ super.key, required this.download });

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image),
          const SizedBox(width: 5.0),
          Text(title,style: TextStyle(fontFamily: FamilyTheme.regular,
              color: ColorTheme.title, fontSize: 12))
        ]);
  }
}