import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';

import '../../../../../../../core/themes/family_theme.dart';
import '../../../domain/enum/order_status_enum.dart';
import 'order_details_rich_widget.dart';

class DetailsIncompleteWidget extends StatelessWidget {
  final OrderEntity order;
  final Function() moreDetails;

  const DetailsIncompleteWidget(
      {super.key, required this.order, required this.moreDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
        spacing: 5.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(order.title,
              style: TextStyle(
                  fontFamily: FamilyTheme.mediumItalic,
                  color: Colors.black,
                  fontSize: 20)),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            OrderDetailsRichWidget(
                title: "Orçamento nº", description: order.id.toString()),
            Text(StatusExtension.fromTitle(order.status),
                style: TextStyle(
                    color: ColorTheme.orange,
                    fontSize: 10,
                    fontFamily: FamilyTheme.medium))
          ]),
          OrderDetailsRichWidget(
              title: "Ambientes:", description: order.environments),
          const SizedBox(height: 15.0),
          Center(
            child: InkWell(
              onTap: moreDetails,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Mostrar detalhes",
                      style: TextStyle(
                          color: ColorTheme.description,
                          fontSize: 10,
                          fontFamily: FamilyTheme.medium)),
                  Icon(Icons.keyboard_arrow_down_rounded,
                      color: ColorTheme.description)
                ],
              ),
            ),
          )
        ]);
  }
}
