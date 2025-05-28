import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/shared/chat_order_button/cancel_button_widget.dart';
import 'package:marcenaria/modules/employee/orders/presentation/stores/waiting_interesting/details/stores/waiting_interesting_details_store.dart';

import '../../../../../../../core/data/router_global_mapper.dart';
import '../../../../../../../core/data/store/core_store.dart';
import '../../../../../../../core/themes/color_theme.dart';
import '../../../../../../../core/themes/family_theme.dart';
import '../../../../../../admin/shared/chat_order_button/chat_order_button_widget.dart';
import '../../../../../../admin/shared/chat_order_button/confirmation_button_widget.dart';
import '../../../../../../admin/shared/details_card/details_card_widget.dart';
import '../../../../../../customer/home/orders/domain/entities/order_entity.dart';
import '../../../../../../customer/home/orders/domain/enum/order_status_enum.dart';
import '../../../../../../customer/shared/proposal_card/proposal_card_widget.dart';
import '../../../../../details/presentation/components/indicator_step_employee_widget.dart';
import 'components/details_proposal_cancel_pop_widget.dart';

class WaitingInterestingDetailsPage extends StatefulWidget {
  final int orderID;

  const WaitingInterestingDetailsPage({super.key, required this.orderID});

  @override
  State<WaitingInterestingDetailsPage> createState() =>
      _WaitingInterestingDetailsPageState();
}

class _WaitingInterestingDetailsPageState
    extends State<WaitingInterestingDetailsPage> {
  final WaitingInterestingDetailsStore store =
      Modular.get<WaitingInterestingDetailsStore>();

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
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DetailsCardWidget(
                            order: store.order!,
                            statusColor: const Color(0xFF47A9FF),
                            status: "Em produção",
                          ),
                          const SizedBox(height: 20.0),
                          Text("Proposta de produção",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: FamilyTheme.bold,
                                  color: ColorTheme.black3,
                                  fontSize: 16)),
                          const SizedBox(height: 5.0),
                          ProporsalCardWidget(order: store.proposal!),
                          const SizedBox(height: 20.0),
                          const IndicatorStepEmployeeWidget(index: 1),
                          SizedBox(
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                spacing: 20,
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: CancelButtonWidget(
                                        onPressed: () => showModalBottomSheet(
                                            backgroundColor:
                                                ColorTheme.background,
                                            context: context,
                                            builder: (context) =>
                                                DetailsProposalCancelPopWidget(
                                                  cancelOrder: () =>
                                                      store.cancelProposal(
                                                          context: context),
                                                  order: OrderEntity(
                                                      id: store.order?.id ?? 0,
                                                      title:
                                                          store.order?.title ??
                                                              "",
                                                      environments: store.order
                                                              ?.environments ??
                                                          "",
                                                      status:
                                                          OrderStatus.appoval),
                                                )),
                                        title: "Recusar Proposta",
                                        size: 10),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      spacing: 5.0,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        ChatOrderButtonWidget(
                                            title: "Conversar com suporte",
                                            size: 12,
                                            onPressed: () => Modular.to.pushNamed(
                                                RouterGlobalMapper.chatSupport,
                                                arguments: OrderEntity(
                                                    id: store.order?.id ?? 0,
                                                    title: store.order?.title ??
                                                        "",
                                                    environments: store.order
                                                            ?.environments ??
                                                        "",
                                                    status:
                                                        OrderStatus.appoval))),
                                        ConfirmationButtonWidget(
                                            size: 12,
                                            title: "Sinalizar interesse",
                                            onPressed: () =>
                                                store.approvalProposal(
                                                    context: context))
                                      ],
                                    ),
                                  ),
                                ]),
                          ),
                          const SizedBox(height: 40.0),
                        ]),
                  ),
                )),
    );
  }
}
