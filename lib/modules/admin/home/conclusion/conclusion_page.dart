import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/admin/home/conclusion/store/conclusion_store.dart';
import 'package:marcenaria/modules/admin/home/presentation/components/order_empty_widget.dart';
import 'package:marcenaria/modules/admin/home/presentation/components/order_loading_widget.dart';
import 'package:marcenaria/modules/admin/home/presentation/components/proposal_card_widget.dart';
import 'package:marcenaria/modules/admin/home/presentation/components/proposal_filter_widget.dart';

import '../../../../core/themes/color_theme.dart';
import '../../../../core/themes/family_theme.dart';

class ConclusionPage extends StatefulWidget {
  const ConclusionPage({super.key});

  @override
  State<ConclusionPage> createState() => _ConclusionPageState();
}

class _ConclusionPageState extends State<ConclusionPage>
    with AutomaticKeepAliveClientMixin {
  final String message = "Nenhuma proposta concluída.";

  final ConclusionStore store = Modular.get<ConclusionStore>();

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
          child: store.loading
              ? OrderLoadingWidget()
              : Column(children: [
                  ProposalFilterWidget(onChanged: (value) {}),
                  const SizedBox(height: 20),
                  store.orders.isEmpty
                      ? OrderEmptyWidget(title: message)
                      : RefreshIndicator.adaptive(
                          onRefresh: () => store.loadingMoreOrders(),
                          child: SingleChildScrollView(
                            controller: store.scroll,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Pedidos Concluídos",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontFamily: FamilyTheme.regular,
                                        color: ColorTheme.black3,
                                        fontSize: 12)),
                                const SizedBox(height: 10),
                                ListView.separated(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    separatorBuilder: (context, index) =>
                                        const SizedBox(height: 10.0),
                                    itemCount: store.orders.length,
                                    itemBuilder: (context, index) =>
                                        ProposalCardWidget(
                                            order: store.orders[index],
                                            onPressed: () => Modular.to.pushNamed(
                                                RouterMapper
                                                    .conclusionOrderDetailsIntern,
                                                arguments:
                                                    store.orders[index].id))),
                                const SizedBox(height: 20.0),
                                if (store.paginationLoading)
                                  const Center(
                                      child: CircularProgressIndicator())
                              ],
                            ),
                          ),
                        )
                ]),
        ),
      ),
    );
  }
}
