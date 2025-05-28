import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/router_global_mapper.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';

import '../../../profile/presentation/utils/profile_utils.dart';

class ConversationTileWidget extends StatelessWidget {
  final String name;

  final OrderEntity order;
  final String colaborations;

  final Function() onPressed;

  const ConversationTileWidget(
      {super.key,
      required this.order,
      required this.colaborations,
      required this.onPressed,
      required this.name});

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
                      child: Text(
                        ProfileUtils.initalLetters(name),
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: FamilyTheme.regular,
                          color: Colors.black,
                        ),
                      ),
                    )),
              )
            ],
          ),
          minLeadingWidth: 60,
          horizontalTitleGap: 20,
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text("Pedido Nº ${order.id}",
                    style: TextStyle(
                        fontFamily: FamilyTheme.regular,
                        color: ColorTheme.black3,
                        fontSize: 12)),
              ),
            ],
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(order.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontFamily: FamilyTheme.medium,
                          color: ColorTheme.black3,
                          fontSize: 16)),
                  Text(colaborations,
                      style: TextStyle(
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
