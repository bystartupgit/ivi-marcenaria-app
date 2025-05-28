import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/customer/home/presentation/components/proposal_card_widget.dart';

import 'order_empty_widget.dart';

class ProposalListWidget extends StatelessWidget {
  final String message;
  final List<OrderEntity> orders;

  final Function(int value) navigation;

  const ProposalListWidget(
      {super.key,
      required this.orders,
      required this.message,
      required this.navigation});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => orders.isEmpty
          ? OrderEmptyWidget(title: message)
          : SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10.0),
                      itemCount: orders.length,
                      itemBuilder: (context, index) => ProposalCardWidget(
                          order: orders[index],
                          navigation: () => navigation(orders[index].id))),
                  const SizedBox(height: 20.0)
                ],
              ),
            ),
    );
  }
}
