import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

class EnvironmentTextWidget extends StatelessWidget {

  final String title = "Ambientes: ";
  final List<String> environments;

  const EnvironmentTextWidget({ super.key, required this.environments });

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(text: title, style: TextStyle(color: ColorTheme.pureBlack,fontSize: 10,fontFamily: FamilyTheme.medium)),
          TextSpan(text: environments.join(","), style: TextStyle(color: ColorTheme.pureBlack,fontSize: 10,fontFamily: FamilyTheme.regular)),
        ],
      ),
    );
  }
}
