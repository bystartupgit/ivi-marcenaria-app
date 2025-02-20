import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class CreateProporseBackButtonWidget extends StatelessWidget {
  
  final String image = "assets/login/svgs/back.svg";
  final String title = "Voltar";

  const CreateProporseBackButtonWidget({ super.key });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pop(context),
      child: Card(
        elevation: 3,
        child: Container(
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: ColorTheme.orange
          ),
          child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5.0,
              children: [
                SvgPicture.asset(image,colorFilter: const ColorFilter.mode( Colors.white, BlendMode.srcIn)),
                Text(title,style: TextStyle(fontFamily: FamilyTheme.regular,
                    color: Colors.white, fontSize: 12))
              ]),
        ),
      ),
    );
  }
}
