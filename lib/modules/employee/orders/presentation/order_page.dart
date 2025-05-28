import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/employee/orders/presentation/components/order_filter_widget.dart';
import 'package:marcenaria/modules/employee/orders/presentation/components/order_list_widget.dart';
import 'package:marcenaria/modules/employee/orders/presentation/components/order_slide_widget.dart';
import 'package:marcenaria/modules/employee/orders/presentation/stores/order_store.dart';

import '../../domain/mappers/router_mapper.dart';
import 'mappers/order_searching_mapper.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with AutomaticKeepAliveClientMixin {
  final OrderStore store = Modular.get<OrderStore>();

  @override
  void initState() {
    store.waitingInteresting.init();
    store.orderPendingStore.init();
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: ColorTheme.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(children: [
            OrderFilterWidget(
                title: OrderSearchingMapper.title,
                description: OrderSearchingMapper.subtitle,
                onChanged: (value) {}),
            const SizedBox(height: 20),
            OrderSlideWidget(store: store),
            const SizedBox(height: 20),
            Expanded(
              child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: store.controller,
                  children: [
                    store.waitingInteresting.orders.isEmpty
                        ? Center(
                            child: Text(
                              "Nenhuma proposta no momento para avaliar.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: FamilyTheme.regular,
                                  fontSize: 14,
                                  color: ColorTheme.black3),
                            ),
                          )
                        : OrderListWidget(
                            subtitle: "Aguardando Confirmação",
                            colorSubtitle: ColorTheme.green,
                            navigation: (value) => Modular.to
                                    .pushNamed(
                                        RouterMapper.orderWaitingDetailsIntern,
                                        arguments: value)
                                    .then((result) {
                                  if (result == true) {
                                    store.waitingInteresting
                                        .removeOrderByID(value);
                                  }
                                }),
                            orders: store.waitingInteresting.orders,
                            title: "Serviços aguardando aceitar recentes"),
                    store.orderPendingStore.orders.isEmpty
                        ? Center(
                            child: Text(
                              "Nenhuma proposta no momento para iniciar.",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: FamilyTheme.regular,
                                  fontSize: 14,
                                  color: ColorTheme.black3),
                            ),
                          )
                        : OrderListWidget(
                            orders: store.orderPendingStore.orders,
                            subtitle: "Aguardando início da produção",
                            colorSubtitle: const Color(0xFF9747FF),
                            navigation: (value) => Modular.to.pushNamed(
                                RouterMapper.orderPendingDetailsIntern,
                                arguments: value),
                            title: "Serviços em andamento")
                  ]),
            )
          ]),
        ),
      ),
    );
  }
}
