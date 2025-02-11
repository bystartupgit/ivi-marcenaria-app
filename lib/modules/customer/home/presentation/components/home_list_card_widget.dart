import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';

import '../../../../../core/themes/family_theme.dart';
import 'home_card_widget.dart';

class HomeListCardWidget extends StatelessWidget {

  final String title;
  final String button = "Ver todos";

  final List<OrderEntity> orders;

  final Function() seeAll;
  final Function(OrderEntity order) details;

  const HomeListCardWidget({super.key,
    required this.details,
    required this.title, required this.orders, required this.seeAll});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return orders.isEmpty ? Container() : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title,style: TextStyle(fontSize: 14,fontFamily: FamilyTheme.regular,color: Colors.black)),
                InkWell(
                    onTap: seeAll, child: Text(button,style: TextStyle(fontSize: 14,fontFamily: FamilyTheme.regular,color: Colors.black))),
              ]),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 10.0,
                  children: orders.map((e) => HomeCardWidget(order: e, details: details)).toList()
                ),
            )
          ]);
      }
    );
  }
}
