import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';

import '../../../../customer/home/profile/presentation/utils/profile_utils.dart';


class ChatTileWidget extends StatelessWidget {

  final String name;

  final String subtitle = "Pedido Nº ";
  final OrderEntity order;

  const ChatTileWidget({super.key, required this.order, required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        horizontalTitleGap: 30,
        leading: Stack(
          clipBehavior: Clip.none,
          children: [
            const CircleAvatar(backgroundImage: AssetImage("assets/logo/logo.jpg"),maxRadius: 30),
            Positioned(
              left: 30,
              child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      border: Border.all(color: ColorTheme.orange,width: 2),
                      shape: BoxShape.circle,
                      color: Colors.white),
                  child: Center(
                    child: Text(ProfileUtils.initalLetters(name),
                      style: TextStyle(fontSize: 10,fontFamily: FamilyTheme.regular,color: Colors.black,),),
                  )),)
          ],
        ),
        minLeadingWidth: 70,
        title: Text(order.title,style: TextStyle(color: ColorTheme.black3,
            fontFamily: FamilyTheme.medium,fontSize: 16)),
        subtitle: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(subtitle + order.id.toString(),style: TextStyle(color: ColorTheme.black3,
            fontFamily: FamilyTheme.regular,fontSize: 14)),
            Text("Suporte e você",style: TextStyle(color: ColorTheme.black3,
                fontFamily: FamilyTheme.regular,fontSize: 10)),
          ],
        ),
    );
  }
}
