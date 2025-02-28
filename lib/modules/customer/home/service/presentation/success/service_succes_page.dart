import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../core/themes/color_theme.dart';

class ServiceSuccesPage extends StatelessWidget {

  final OrderEntity order;

  const ServiceSuccesPage({ super.key, required this.order });

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) => Scaffold(
            backgroundColor: ColorTheme.background,
            appBar: AppBar(
                leading: IconButton(onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios_new_rounded, size: 20,color: ColorTheme.black)),
                backgroundColor: ColorTheme.background),
            body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                    ]))
        ));
  }
}
