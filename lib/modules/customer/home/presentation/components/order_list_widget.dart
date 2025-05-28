import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/customer/home/presentation/components/order_empty_widget.dart';

import 'order_card_widget.dart';

class OrderListWidget extends StatelessWidget {
  final Function() addNewOrders;

  final String message;
  final List<OrderEntity> orders;
  final Function(OrderEntity value) details;

  const OrderListWidget(
      {super.key,
      required this.orders,
      required this.addNewOrders,
      required this.message,
      required this.details});

  @override
  Widget build(BuildContext context) {
    return orders.isEmpty
        ? OrderEmptyWidget(title: message)
        : RefreshIndicator.adaptive(
            onRefresh: () async => addNewOrders,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 10.0),
                      itemCount: orders.length,
                      itemBuilder: (context, index) => OrderCardWidget(
                          order: orders[index], details: details)),
                  const SizedBox(height: 20.0)
                ],
              ),
            ),
          );
  }
}
