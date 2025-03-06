import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/customer/home/domain/mappers/home_about_mapper.dart';
import 'package:marcenaria/modules/customer/home/domain/mappers/home_title_mapper.dart';
import 'package:marcenaria/modules/customer/home/orders/presentation/stores/order_store.dart';
import 'package:marcenaria/modules/customer/home/presentation/components/home_row_cards_widget.dart';
import 'package:marcenaria/modules/customer/home/presentation/stores/home_store.dart';
import 'package:marcenaria/modules/customer/home/proposal/presentation/stores/proposal_store.dart';
import 'package:marcenaria/modules/customer/navigation/presentation/stores/navigation_store.dart';

import '../../data/routers/customer_routers.dart';
import 'components/home_carrousel_widget.dart';
import 'components/home_header_greatings_widget.dart';
import 'components/home_header_widget.dart';
import 'components/home_list_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin  {

  final NavigationStore navigation = Modular.get<NavigationStore>();
  final CoreStore core = Modular.get<CoreStore>();
  final HomeStore store = Modular.get<HomeStore>();
  final OrderStore order = Modular.get<OrderStore>();
  final ProposalStore proposal = Modular.get<ProposalStore>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: ColorTheme.background,
        body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeHeaderWidget(name: core.profile?.name ?? "Cliente"),
                  const SizedBox(height: 20.0),
                  const HomeHeaderGreatingsWidget(),
                  const SizedBox(height: 15.0),
                  const HomeRowCardsWidget(),
                  const SizedBox(height: 10.0),
                  Observer(
                    builder: (_) => HomeListCardWidget(
                        details: (value) => Modular.to.pushNamed(CustomerRouters.orderWaitingDetailsIntern, arguments: value),
                        seeAll: () => navigation.setIndex(1),
                        title: HomeTitleMapper.oportunities,
                        orders: order.waitingOrders),
                  ),
                  const SizedBox(height: 10.0),
                  HomeListCardWidget(
                      details: (value) => Modular.to.pushNamed(CustomerRouters.productionIntern,arguments: value.id),
                      seeAll: () => navigation.setIndex(2),
                      title: HomeTitleMapper.currents, orders: proposal.productionOrders),
                  const SizedBox(height: 20.0),
                  HomeCarrouselWidget(onChanged: store.setIndex,
                      dots: 3,
                      index: store.index,abouts: HomeAboutMapper.abouts),
                  const SizedBox(height: 20.0),
                ],
              ),
            )),
      ),
    );
  }
}