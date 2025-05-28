import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';

import '../../../../../core/themes/family_theme.dart';

class HomeCardWidget extends StatelessWidget {
  final OrderEntity order;
  final Function(OrderEntity onder) details;

  const HomeCardWidget({super.key, required this.order, required this.details});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => details(order),
      child: SizedBox(
          height: 100,
          width: 300,
          child: Card(
            elevation: 2,
            child: Row(children: [
              Expanded(
                  flex: 1,
                  child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/covers/cover_1.png"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0))))),
              Expanded(
                  flex: 2,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0))),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 150,
                                  child: Text(order.title,
                                      maxLines: 2,
                                      style: TextStyle(
                                          height: 1.0,
                                          fontFamily: FamilyTheme.medium,
                                          color: Colors.black,
                                          fontSize: 16)),
                                ),
                                Text("Orçamento nº ${order.id}",
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontFamily: FamilyTheme.regular,
                                        color: Colors.black,
                                        fontSize: 12)),
                              ]),
                          Icon(Icons.arrow_forward_ios_rounded,
                              color: ColorTheme.black, size: 20)
                        ],
                      )))
            ]),
          )),
    );
  }
}
