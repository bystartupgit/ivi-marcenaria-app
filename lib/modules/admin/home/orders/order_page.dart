import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/modules/admin/home/presentation/components/proposal_filter_widget.dart';

import '../../../../core/themes/color_theme.dart';
import '../../../customer/home/presentation/components/order_loading_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
        backgroundColor: ColorTheme.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: false ? OrderLoadingWidget() : Column(
              children: [
                ProposalFilterWidget(onChanged: (value) {}),
        ]),
      ),
      ));
  }
}
