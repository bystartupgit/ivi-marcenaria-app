
import 'package:flutter/material.dart';
import 'package:marcenaria/modules/customer/home/orders/presentation/components/order_filter_widget.dart';

import '../../../../../core/themes/color_theme.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(

            children: [

              OrderFilterWidget(onChanged: (value) {}),
              const SizedBox(height: 20),



            ]),
      ),
    );
  }
}
