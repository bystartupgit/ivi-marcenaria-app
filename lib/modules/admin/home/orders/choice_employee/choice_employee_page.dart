import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/admin/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/admin/home/orders/choice_employee/store/choice_employee_store.dart';
import 'package:marcenaria/modules/admin/home/presentation/components/order_empty_widget.dart';
import 'package:marcenaria/modules/admin/home/presentation/components/proposal_card_widget.dart';

class ChoiceEmployeePage extends StatelessWidget {

  final String message = "Nenhuma proposta aceita para indicar prestadores no momento.";
  final String status = "Escolher Prestador";
  final Color colorStatus = ColorTheme.black;

  final ChoiceEmployeeStore store;

  ChoiceEmployeePage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return store.orders.isEmpty ? OrderEmptyWidget(title: message) :
        RefreshIndicator.adaptive(
          onRefresh: () => store.loadingNewOrders(context: context),
          child: SingleChildScrollView(
            controller: store.scroll,
            child: Column(
              children: [
                ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const SizedBox(height: 10.0),
                    itemCount: store.orders.length,
                    itemBuilder: (context,index) => ProposalCardWidget(order: store.orders[index],
                        status: status,
                        colorStatus: colorStatus,
                        onPressed: () => Modular.to.pushNamed(RouterMapper.choiceEmployeeDetailsIntern,
                            arguments: store.orders[index].id).then((e) {

                              if(e == true) { store.removeOrderByID(store.orders[index].id); }
                        }))),
                const SizedBox(height: 20.0),
                if(store.paginationLoading) const Center(child: CircularProgressIndicator())
              ],
            ),
          ),
        );
      }
    );
  }
}
