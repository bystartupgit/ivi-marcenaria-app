import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/router_global_mapper.dart';
import 'package:marcenaria/modules/admin/home/orders/waiting_employee/details/potential_employee/potential_employee_widget.dart';
import 'package:marcenaria/modules/admin/home/orders/waiting_employee/details/stores/waiting_employee_details_store.dart';
import 'package:marcenaria/modules/admin/shared/details_card/details_card_widget.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';
import '../../../../../customer/home/orders/domain/entities/order_entity.dart';
import '../../../../../customer/home/orders/domain/enum/order_status_enum.dart';
import '../../../../shared/chat_order_button/chat_order_button_widget.dart';
import '../../../../shared/chat_order_button/confirmation_button_widget.dart';
import '../../../../shared/proposal_payment_card/proposal_payment_card_widget.dart';
import '../../choice_employee/details/select_employee/components/employee_card_widget.dart';

class WaitingEmployeeDetailsPage extends StatefulWidget {
  final int orderID;

  const WaitingEmployeeDetailsPage({super.key, required this.orderID});

  @override
  State<WaitingEmployeeDetailsPage> createState() =>
      _WaitingEmployeeDetailsPageState();
}

class _WaitingEmployeeDetailsPageState
    extends State<WaitingEmployeeDetailsPage> {
  final WaitingEmployeeDetailsStore store =
      Modular.get<WaitingEmployeeDetailsStore>();

  @override
  void initState() {
    store.init(orderID: widget.orderID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: ColorTheme.background,
          appBar: AppBar(
              backgroundColor: ColorTheme.background,
              leading: IconButton(
                  onPressed: () => Modular.to.pop(),
                  icon: Icon(Icons.arrow_back_ios_new_rounded,
                      color: ColorTheme.black2))),
          body: store.loading
              ? Center(
                  child: CircularProgressIndicator(color: ColorTheme.orange))
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DetailsCardWidget(
                          order: store.order!,
                          statusColor: const Color(0xFF47A9FF),
                          status: "Em produção",
                        ),
                        const SizedBox(height: 20.0),
                        Text("Detalhe do Pagamento",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontFamily: FamilyTheme.medium,
                                color: ColorTheme.black3,
                                fontSize: 12)),
                        const SizedBox(height: 5.0),
                        ProposalPaymentCardWidget(proposal: store.proposal!),
                        const SizedBox(height: 20.0),
                        Expanded(
                          child: ListView.separated(
                              controller: store.scroll,
                              shrinkWrap: true,
                              itemBuilder: (context, index) =>
                                  EmployeeCardWidget(
                                      employee: store.employees[index],
                                      select: null),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 10),
                              itemCount: store.employees.length),
                        ),
                        const SizedBox(height: 20.0),
                        SizedBox(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              spacing: 10,
                              children: [
                                Expanded(
                                  child: ChatOrderButtonWidget(
                                      title: "Conversar com Cliente",
                                      size: 12,
                                      onPressed: () => Modular.to.pushNamed(
                                          RouterGlobalMapper.chatSupport,
                                          arguments: OrderEntity(
                                              id: store.order?.id ?? 0,
                                              title: store.order?.title ?? "",
                                              environments:
                                                  store.order?.environments ??
                                                      "",
                                              status: OrderStatus.appoval))),
                                ),
                                Expanded(
                                    child: ConfirmationButtonWidget(
                                        size: 12,
                                        title: "Designar prestadores",
                                        onPressed: () => showModalBottomSheet(
                                            context: context,
                                            backgroundColor:
                                                ColorTheme.background,
                                            isDismissible: false,
                                            isScrollControlled: true,
                                            builder: (context) =>
                                                PotentialEmployeeWidget(
                                                    proposalID: store.proposal
                                                            ?.idProposta ??
                                                        0))))
                              ]),
                        ),
                        const SizedBox(height: 40.0),
                      ]),
                )),
    );
  }
}
