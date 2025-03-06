import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/employee/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/employee/service/presentation/finish/stores/finish_store.dart';

import '../../../../admin/home/presentation/components/order_empty_widget.dart';
import '../../../../admin/home/presentation/components/proposal_card_widget.dart';

class FinishPage extends StatelessWidget {

  final String message = "Nenhuma pedido finalizado.";

  final FinishStore store;

  const FinishPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) {
          return store.orders.isEmpty ? OrderEmptyWidget(title: message) :
          RefreshIndicator.adaptive(
            onRefresh: () => store.loadingMoreOrders(),
            child: Column(
              children: [
                ListView.separated(
                    controller: store.scroll,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const SizedBox(height: 10.0),
                    itemCount: store.orders.length,
                    itemBuilder: (context,index) => ProposalCardWidget(order: store.orders[index],
                      onPressed: () => Modular.to.pushNamed(RouterMapper.finishDetailsIntern,arguments: store.orders[index].id),)),
                const SizedBox(height: 20.0),
              ],
            ),
          );
        }
    );
  }
}