import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../../../core/themes/family_theme.dart';
import '../../../../customer/home/profile/presentation/components/edit_icons.dart';
import '../../../domain/dto/profile_dto.dart';
import '../../../domain/mappers/router_mapper.dart';

class ProfileEditButtonWidget extends StatelessWidget {
  final Function(ProfileDTO dto) update;
  final String title = "atualizar dados";

  const ProfileEditButtonWidget({super.key, required this.update});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Modular.to.pushNamed(RouterMapper.profileFormIntern).then((e) {
        e is ProfileDTO ? update(e) : null;
      }),
      child: Row(
        spacing: 5.0,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(EditIcons.edit, color: ColorTheme.black3, size: 15),
          Text(title,
              style: TextStyle(
                  fontSize: 10,
                  fontFamily: FamilyTheme.regular,
                  color: ColorTheme.black3))
        ],
      ),
    );
  }
}
