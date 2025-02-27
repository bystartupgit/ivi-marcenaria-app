import 'package:flutter/material.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';
import '../../../profile/presentation/utils/profile_utils.dart';

class ConversationSuportTileWidget extends StatelessWidget {

  final String title = "Suporte";
  final String name;

  final String colaborations;

  final Function() onPressed;

  const ConversationSuportTileWidget({ super.key, required this.colaborations,
    required this.onPressed, required this.name });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Card(
        elevation: 3,
        color: ColorTheme.lightGray,
        child: ListTile(
          contentPadding: const EdgeInsets.only(left: 10),
          leading: Stack(
            clipBehavior: Clip.none,
            children: [
              const CircleAvatar(
                  backgroundImage: AssetImage("assets/logo/logo.jpg"),
                  maxRadius: 20),
              Positioned(
                left: 20,
                child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorTheme.orange, width: 2),
                        shape: BoxShape.circle,
                        color: Colors.white),
                    child: Center(
                      child: Text(ProfileUtils.initalLetters(name),
                        style: TextStyle(fontSize: 10,
                          fontFamily: FamilyTheme.regular,
                          color: Colors.black,),),
                    )),)
            ],
          ),
          minLeadingWidth: 60,
          horizontalTitleGap: 20,
          subtitle: Container(),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontFamily: FamilyTheme.medium,
                          color: ColorTheme.black3,
                          fontSize: 16)),
                  Text(colaborations, style: TextStyle(
                      fontFamily: FamilyTheme.regular,
                      color: ColorTheme.black3,
                      fontSize: 10)),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(right: 5.0),
                child: Icon(Icons.arrow_forward_ios, size: 14),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
