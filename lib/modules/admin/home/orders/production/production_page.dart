import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/admin/home/orders/production/stores/production_store.dart';
import 'package:marcenaria/modules/admin/home/presentation/components/proposal_card_widget.dart';

import '../../../../customer/home/presentation/components/order_empty_widget.dart';

class ProductionPage extends StatelessWidget {
  final String message = "Nenhuma proposta em produção.";

  final ProductionStore store;

  const ProductionPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return store.orders.isEmpty
          ? OrderEmptyWidget(title: message)
          : RefreshIndicator.adaptive(
              onRefresh: () => store.loadingMoreOrders(),
              child: SingleChildScrollView(
                controller: store.scroll,
                child: Column(
                  children: [
                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10.0),
                        itemCount: store.orders.length,
                        itemBuilder: (context, index) => ProposalCardWidget(
                            order: store.orders[index],
                            onPressed: () => Modular.to
                                    .pushNamed(
                                        RouterMapper
                                            .productionOrderDetailsIntern,
                                        arguments: store.orders[index].id)
                                    .then((e) {
                                  if (e == true) {
                                    store.removeOrderByID(
                                        store.orders[index].id);
                                  }
                                }))),
                    const SizedBox(height: 20.0),
                    if (store.paginationLoading)
                      const Center(child: CircularProgressIndicator())
                  ],
                ),
              ),
            );
    });
  }
}
