import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';

import '../../../../admin/home/presentation/components/proposal_card_widget.dart';

class OrderListWidget extends StatelessWidget {
  final String title;
  final String? subtitle;

  final Color? colorSubtitle;

  final List<OrderEntity> orders;

  final Function(int value) navigation;

  const OrderListWidget(
      {super.key,
      required this.navigation,
      this.subtitle,
      this.colorSubtitle,
      required this.orders,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Column(
          spacing: 10.0,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: FamilyTheme.regular,
                    color: Colors.black)),
            Expanded(
                child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 10.0),
                    itemCount: orders.length,
                    itemBuilder: (context, index) => ProposalCardWidget(
                        status: subtitle,
                        colorStatus: colorSubtitle,
                        order: orders[index],
                        onPressed: () => navigation(orders[index].id)))),
          ]);
    });
  }
}
