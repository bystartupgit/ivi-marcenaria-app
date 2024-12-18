

import 'package:flutter/material.dart';
import 'package:marcenaria/core/data/entities/order_entity.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/employee/orders/presentation/components/order_card_widget.dart';

class OrderListWidget extends StatelessWidget {

  final String title = "Serviços concluídos";
  final List<OrderEntity> orders;

  const OrderListWidget({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.0,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(fontSize: 12,fontFamily: FamilyTheme.regular,color: Colors.black)),
        Expanded(
          child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context,index) => OrderCardWidget()),
        ),
      ],
    );
  }
}
