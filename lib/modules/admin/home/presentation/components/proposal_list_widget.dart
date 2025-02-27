import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';

import 'order_empty_widget.dart';
import 'proposal_card_widget.dart';

class ProposalListWidget extends StatelessWidget {

  final String message;
  final List<OrderEntity> orders;

  final Function(int value) onPressed;

  const ProposalListWidget({super.key, required this.orders, required this.message, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return orders.isEmpty ? OrderEmptyWidget(title: message) : SingleChildScrollView(
      child: Column(
        children: [
          ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => const SizedBox(height: 10.0),
              itemCount: orders.length,
              itemBuilder: (context,index) => ProposalCardWidget(order: orders[index],onPressed: () => onPressed(orders[index].id))),
          const SizedBox(height: 20.0)
        ],
      ),
    );
  }
}