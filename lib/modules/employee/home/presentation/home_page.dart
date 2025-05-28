import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/customer/home/presentation/components/home_header_widget.dart';
import 'package:marcenaria/modules/employee/domain/mappers/home_about_mapper.dart';
import 'package:marcenaria/modules/employee/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/employee/home/presentation/stores/home_store.dart';
import 'package:marcenaria/modules/employee/orders/presentation/stores/order_store.dart';
import 'package:marcenaria/modules/employee/service/presentation/stores/service_store.dart';

import '../../../../core/data/store/core_store.dart';
import '../../../customer/home/presentation/components/home_carrousel_widget.dart';
import '../../../customer/home/presentation/components/home_list_card_widget.dart';
import '../../domain/mappers/home_title_mapper.dart';
import '../../navigation/stores/navigation_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NavigationStore navigation = Modular.get<NavigationStore>();
  final CoreStore core = Modular.get<CoreStore>();
  final HomeStore store = Modular.get<HomeStore>();
  final OrderStore order = Modular.get<OrderStore>();
  final ServiceStore service = Modular.get<ServiceStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: ColorTheme.background,
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeHeaderWidget(name: core.profile?.name ?? "Prestador"),
              const SizedBox(height: 10.0),
              HomeCarrouselWidget(
                  onChanged: store.setIndex,
                  dots: 2,
                  index: store.index,
                  abouts: HomeAboutMapper.abouts),
              HomeListCardWidget(
                  title: HomeTitleMapper.oportunities,
                  details: (value) => Modular.to.pushNamed(
                      RouterMapper.orderWaitingDetailsIntern,
                      arguments: value),
                  seeAll: () => navigation.setIndex(1),
                  orders: List.from(order.waitingInteresting.orders)),
              const SizedBox(height: 10.0),
              HomeListCardWidget(
                  details: (value) => Modular.to.pushNamed(
                      RouterMapper.orderPendingDetailsIntern,
                      arguments: value),
                  seeAll: () => navigation.setIndex(1),
                  title: HomeTitleMapper.pendentes,
                  orders: List.from(order.orderPendingStore.orders)),
              const SizedBox(height: 10.0),
              HomeListCardWidget(
                  details: (value) => Modular.to.pushNamed(
                      RouterMapper.productionDetailsIntern,
                      arguments: value),
                  seeAll: () => navigation.setIndex(2),
                  title: HomeTitleMapper.progress,
                  orders: List.from(service.production.orders)),
              const SizedBox(height: 20.0),
            ],
          ),
        )),
      ),
    );
  }
}
