

import 'package:flutter/material.dart';
import 'package:marcenaria/core/data/entities/order_entity.dart';
import 'package:marcenaria/modules/employee/orders/presentation/components/order_card_widget.dart';

class OrderListWidget extends StatelessWidget {

  final List<OrderEntity> orders;

  const OrderListWidget({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context,index) => OrderCardWidget());
  }
}
