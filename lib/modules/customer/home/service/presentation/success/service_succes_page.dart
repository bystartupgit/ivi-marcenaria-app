import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/success/components/success_title_widget.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/success/stores/service_success_store.dart';

import '../../../../../../core/themes/color_theme.dart';
import 'components/success_details_card_widget.dart';

class ServiceSuccesPage extends StatelessWidget {

  final ServiceSuccessStore store = Modular.get<ServiceSuccessStore>();

  final OrderEntity order;

  ServiceSuccesPage({ super.key, required this.order });

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) => PopScope(
            canPop: false,
            child: Scaffold(
            backgroundColor: ColorTheme.background,
            appBar: AppBar(
                leading: IconButton(onPressed: () => Modular.to.popUntil(ModalRoute.withName(Modular.initialRoute)),
                    icon: Icon(Icons.arrow_back_ios_new_rounded, size: 20,color: ColorTheme.black)),
                backgroundColor: ColorTheme.background),
            body: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                        const SuccessTitleWidget(),
                        const SizedBox(height: 10.0),
                        SuccessDetailsCardWidget(order: order,changeMoreDetails: store.setShowMore, moreDetails: store.showMore)
                    ]))
        )));
  }
}
