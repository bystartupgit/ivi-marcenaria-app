import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/home/orders/choice_employee/choice_employee_page.dart';
import 'package:marcenaria/modules/admin/home/orders/production/production_page.dart';
import 'package:marcenaria/modules/admin/home/orders/stores/order_store.dart';
import 'package:marcenaria/modules/admin/home/orders/waiting_employee/waiting_employee_page.dart';
import 'package:marcenaria/modules/admin/home/presentation/components/proposal_filter_widget.dart';

import '../../../../core/themes/color_theme.dart';
import '../../../customer/home/presentation/components/order_loading_widget.dart';
import 'components/order_slide_widget.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> with AutomaticKeepAliveClientMixin {

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
          child: store.waitingEmployee.loading ? OrderLoadingWidget() : Column(
              children: [
                ProposalFilterWidget(onChanged: (value) {}),
                const SizedBox(height: 20.0),
                OrderSlideWidget(store: store),
                const SizedBox(height: 20.0),
                Expanded(
                    child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: store.controller,
                        children: [
                          WaitingEmployeePage(store: store.waitingEmployee),
                          ChoiceEmployeePage(store: store.choiceEmployee),
                          ProductionPage(store: store.productionStore)
                        ]
                    ))
              ]),
        ),
      ));
  }
}
