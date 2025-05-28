import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/employee/orders/presentation/components/order_filter_widget.dart';
import 'package:marcenaria/modules/employee/orders/presentation/components/order_list_widget.dart';
import 'package:marcenaria/modules/employee/service/presentation/finish/finish_store.dart';
import 'package:marcenaria/modules/employee/service/presentation/production/production_page.dart';
import 'package:marcenaria/modules/employee/service/presentation/stores/service_store.dart';

import '../../../../core/themes/color_theme.dart';
import '../../../../core/themes/family_theme.dart';
import '../../orders/presentation/mappers/order_searching_mapper.dart';
import 'components/service_slide_widget.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage>
    with AutomaticKeepAliveClientMixin {
  final ServiceStore store = Modular.get<ServiceStore>();

  @override
  void initState() {
    store.production.init();
    store.finish.init();
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
                title: OrderSearchingMapper.conclusionTitle,
                description: OrderSearchingMapper.conclusionSubtitle,
                onChanged: (value) {}),
            const SizedBox(height: 20),
            ServiceSlideWidget(store: store),
            const SizedBox(height: 20),
            Expanded(
              child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: store.controller,
                  children: [
                    ProductionPage(store: store.production),
                    FinishPage(store: store.finish)
                  ]),
            )
          ]),
        ),
      ),
    );
  }
}
