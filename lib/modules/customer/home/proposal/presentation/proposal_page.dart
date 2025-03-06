import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/customer/home/presentation/components/proposal_filter_widget.dart';
import 'package:marcenaria/modules/customer/home/presentation/components/proposal_slide_widget.dart';
import 'package:marcenaria/modules/customer/home/proposal/presentation/stores/proposal_store.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../data/routers/customer_routers.dart';
import '../../orders/domain/mappers/order_empty_mapper.dart';
import '../../presentation/components/order_header_greetings_widget.dart';
import '../../presentation/components/order_loading_widget.dart';
import '../../presentation/components/proposal_list_widget.dart';

class ProposalPage extends StatefulWidget {
  const ProposalPage({super.key});

  @override
  State<ProposalPage> createState() => _ProposalPageState();
}

class _ProposalPageState extends State<ProposalPage> with AutomaticKeepAliveClientMixin {

  final ProposalStore store = Modular.get<ProposalStore>();

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
                ProposalFilterWidget(onChanged: store.setFilter, title: "${store.name},",
                    description: "aqui estão seus pedidos em ${ store.index == 1 ? "produção" : "concluidos"}"),
                const SizedBox(height: 20),
                const OrderHeaderGreatingsWidget(),
                const SizedBox(height: 20),
                ProposalSlideWidget(store: store),
                const SizedBox(height: 20),
                Expanded(
                    child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: store.controller,
                        children: [
                          ProposalListWidget(
                            navigation: (value) => Modular.to.pushNamed(CustomerRouters.productionIntern,arguments: value),
                              orders: store.productionOrdersFiltered,message: OrderEmptyMapper.production),
                          ProposalListWidget(
                              navigation: (value) {},
                              orders: store.finishedOrdersFiltered, message: OrderEmptyMapper.finished)
                        ]
                    ))
              ]),
        ),
      ),
    );
  }
}