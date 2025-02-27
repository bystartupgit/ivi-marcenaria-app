import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/proposal_entity.dart';
import 'package:marcenaria/modules/customer/home/presentation/components/order_empty_widget.dart';

import 'order_proposal_card_widget.dart';

class OrderProposalListWidget extends StatelessWidget {

  final Function() addNewOrders;

  final String message;
  final List<ProposalEntity> orders;
  final Function(ProposalEntity value) details;

  const OrderProposalListWidget({super.key, required this.orders,
    required this.addNewOrders,
    required this.message, required this.details});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => orders.isEmpty ? OrderEmptyWidget(title: message) :
      RefreshIndicator.adaptive(
        onRefresh: () async => addNewOrders,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const SizedBox(height: 10.0),
                  itemCount: orders.length,
                  itemBuilder: (context,index) => OrderProposalCardWidget(order: orders[index],details: details)),
              const SizedBox(height: 20.0)
            ],
          ),
        ),
      ),
    );
  }
}