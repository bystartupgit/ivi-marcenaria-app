import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';

class ChatTileWidget extends StatelessWidget {

  final String subtitle = "Pedido Nº ";
  final OrderEntity order;

  const ChatTileWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const CircleAvatar(backgroundImage: AssetImage("assets/logo/logo.jpg"),maxRadius: 30,),
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
