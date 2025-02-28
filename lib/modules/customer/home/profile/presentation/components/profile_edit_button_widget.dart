import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/customer/home/profile/presentation/components/edit_icons.dart';

import '../../../../data/routers/customer_routers.dart';

class ProfileEditButtonWidget extends StatelessWidget {

  final String title = "atualizar dados";

  const ProfileEditButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed(CustomerRouters.profileFormIntern),
      child: Row(
        spacing: 5.0,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(EditIcons.edit,color: ColorTheme.black3,size: 15),
          Text(title,style: TextStyle(fontSize: 10, fontFamily: FamilyTheme.regular,color: ColorTheme.black3))
        ],
      ),
    );
  }
}
