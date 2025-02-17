
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/mappers/order_empty_mapper.dart';
import 'package:marcenaria/modules/customer/home/presentation/components/order_filter_widget.dart';
import 'package:marcenaria/modules/customer/home/presentation/components/order_list_widget.dart';
import 'package:marcenaria/modules/customer/home/presentation/components/order_loading_widget.dart';
import 'package:marcenaria/modules/customer/home/orders/presentation/stores/order_store.dart';
import 'package:marcenaria/modules/customer/home/presentation/components/order_slide_widget.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../data/routers/customer_routers.dart';
import '../../presentation/components/order_header_greetings_widget.dart';



class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> with AutomaticKeepAliveClientMixin {

  final OrderStore store = Modular.get<OrderStore>();

  @override
  void initState() {
    store.init();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
      builder: (context) => Scaffold(
        backgroundColor: ColorTheme.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: store.loading ? OrderLoadingWidget() : Column(
              children: [
                OrderFilterWidget(onChanged: store.setFilter,title: "${store.name},",
                    description: "aqui estão seus ${ store.index == 1 ? "orçamentos." : "orçamentos aguardando aprovação."}"),
                const SizedBox(height: 20),
                const OrderHeaderGreatingsWidget(),
                const SizedBox(height: 20),
                OrderSlideWidget(store: store),
                const SizedBox(height: 20),
                Expanded(
                  child: PageView(
                      controller: store.controller,
                      children: [
                        OrderListWidget(orders: store.waitingOrdersFiltered,
                            addNewOrders: () => store.loadingNewOrders(),
                            message: OrderEmptyMapper.waitingEmployee, details: (value) => Modular.to.pushNamed(CustomerRouters.orderWaitingDetailsIntern, arguments: value)),
                        OrderListWidget(
                            addNewOrders: () {},
                            orders: store.waitingApprovalOrdersFiltered, message: OrderEmptyMapper.waitAproval,details: (value) {})
                      ]
                  ))
              ]),
        ),
      ),
    );
  }
}
