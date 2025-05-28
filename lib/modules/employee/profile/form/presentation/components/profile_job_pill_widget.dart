import 'package:flutter/material.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class ProfileJobPillWidget extends StatelessWidget {
  final bool selected;
  final String job;
  final Function() add;
  final Function() remove;

  const ProfileJobPillWidget(
      {super.key,
      required this.add,
      required this.remove,
      required this.job,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selected ? remove : add,
      child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: selected ? ColorTheme.orange : ColorTheme.background,
              borderRadius: BorderRadius.circular(20.0)),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Text(job,
                style: TextStyle(
                    color: selected ? Colors.white : Colors.black,
                    fontFamily:
                        selected ? FamilyTheme.bold : FamilyTheme.regular,
                    fontSize: MediaQuery.of(context).size.width * 0.035))
          ])),
    );
  }
}
