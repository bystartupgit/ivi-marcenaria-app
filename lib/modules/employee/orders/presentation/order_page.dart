import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/employee/orders/presentation/components/order_filter_widget.dart';
import 'package:marcenaria/modules/employee/orders/presentation/components/order_slide_widget.dart';
import 'package:marcenaria/modules/employee/orders/presentation/stores/order_store.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  final OrderStore store = Modular.get<OrderStore>();

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
              OrderSlideWidget(store: store),
              const SizedBox(height: 20),
              Expanded(
                child: PageView(
                    controller: store.controller,
                    children: [
                      Container(color: Colors.orange),
                      Container(color: Colors.black)
                    ]
                ),
              )



            ]),
      ),
    );
  }
}

