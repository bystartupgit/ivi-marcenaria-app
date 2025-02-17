import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/customer/home/orders/details/presentation/components/details_cancel_button_widget.dart';
import 'package:marcenaria/modules/customer/home/orders/details/presentation/components/details_cancel_pop_up_widget.dart';
import 'package:marcenaria/modules/customer/home/orders/details/presentation/components/details_indicator_step_widget.dart';
import 'package:marcenaria/modules/customer/home/orders/details/presentation/components/details_suport_button_widget.dart';
import 'package:marcenaria/modules/customer/home/orders/details/presentation/stores/order_waiting_details_store.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../core/data/router_global_mapper.dart';
import '../../../../../../core/themes/color_theme.dart';
import 'components/details_waiting_message_widget.dart';
import 'components/order_details_card_widget.dart';

class OrderWaitingDetailsPage extends StatefulWidget {

  final OrderEntity order;

  const OrderWaitingDetailsPage({ super.key, required this.order });

  @override
  State<OrderWaitingDetailsPage> createState() => _OrderWaitingDetailsPageState();
}

class _OrderWaitingDetailsPageState extends State<OrderWaitingDetailsPage> {

  late final OrderEntity order = widget.order;

  final OrderWaitingDetailsStore store = Modular.get<OrderWaitingDetailsStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => ModalProgressHUD(
        inAsyncCall: store.loading,
        child: Scaffold(
            backgroundColor: ColorTheme.background,
            appBar: AppBar(
                backgroundColor: ColorTheme.background,
                leading: IconButton(onPressed: () => Modular.to.pop(),
                    icon: Icon(Icons.arrow_back_ios_new_rounded,color: ColorTheme.black2))
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                  children: [
                    OrderDetailsCardWidget(order: order, moreDetails: store.showMore,
                        changeMoreDetails: store.setShowMore),
                    const SizedBox(height: 20.0),
                    const DetailsWaitingMessageWidget(),
                    const SizedBox(height: 10.0),
                    const DetailsIndicatorStepWidget(),
                    const SizedBox(height: 20.0),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.center,

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DetailsCancelButtonWidget(
                              iconSize: 10,
                              size: 12,
                              onPressed: () => showDialog(context: context,
                                  builder: (context) => DetailsCancelPopUpWidget(order: order,
                                    cancelOrder: () => store.cancelOrder(order: order, context: context)))),
                          DetailsSuportButtonWidget(size: 12,onPressed: () =>
                              Modular.to.pushNamed(RouterGlobalMapper.chatSupport,
                                  arguments: order)
                          )
                    ])
              ]),
            )),
      ),
    );
  }
}

