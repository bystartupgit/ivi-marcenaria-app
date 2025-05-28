import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/router_global_mapper.dart';
import 'package:marcenaria/core/data/store/core_store.dart';
import 'package:marcenaria/modules/customer/data/routers/customer_routers.dart';
import 'package:marcenaria/modules/customer/home/orders/details/presentation/components/details_cancel_button_widget.dart';
import 'package:marcenaria/modules/customer/home/orders/details/presentation/components/details_suport_button_widget.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/proposal_entity.dart';
import 'package:marcenaria/modules/customer/home/orders/proposal_details/components/payment_button_widget.dart';
import 'package:marcenaria/modules/customer/home/orders/proposal_details/stores/order_proposal_details_store.dart';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../../../core/themes/family_theme.dart';
import '../details/presentation/components/details_cancel_pop_up_widget.dart';
import '../details/presentation/components/details_indicator_step_widget.dart';
import 'components/order_proposal_details_card_widget.dart';
import 'components/proposal_card_review_widget.dart';

class OrderProposalDetailsPage extends StatefulWidget {
  final ProposalEntity order;

  const OrderProposalDetailsPage({super.key, required this.order});

  @override
  State<OrderProposalDetailsPage> createState() =>
      _OrderProposalDetailsPageState();
}

class _OrderProposalDetailsPageState extends State<OrderProposalDetailsPage> {
  late final ProposalEntity order = widget.order;

  final String title = "Seu orçamento esta pronto!";

  final OrderProposalDetailsStore store =
      Modular.get<OrderProposalDetailsStore>();

  @override
  void initState() {
    store.init(orderID: order.idPedido);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => ModalProgressHUD(
        inAsyncCall: store.loading,
        child: Scaffold(
            backgroundColor: ColorTheme.background,
            appBar: AppBar(
                backgroundColor: ColorTheme.background,
                leading: IconButton(
                    onPressed: () => Modular.to.pop(),
                    icon: Icon(Icons.arrow_back_ios_new_rounded,
                        color: ColorTheme.black2))),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      OrderProposalDetailsCardWidget(
                          store: store,
                          order: OrderEntity(
                              id: widget.order.idPedido,
                              title: widget.order.pedido.titulo,
                              environments: "",
                              status: order.status),
                          moreDetails: store.showMore,
                          changeMoreDetails: store.setShowMore),
                      const SizedBox(height: 20.0),
                      Text(title,
                          style: TextStyle(
                            fontFamily: FamilyTheme.medium,
                            color: ColorTheme.black3,
                            fontSize: 20,
                          )),
                      ProporsalCardReviewWidget(
                        store: store,
                        order: widget.order,
                        showMore: () {},
                        showMoreEnable: true,
                        proposal: null,
                      ),
                      const SizedBox(height: 20.0),
                      const DetailsIndicatorStepWidget(index: 2),
                      const SizedBox(height: 20.0),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          spacing: 20.0,
                          children: [
                            Expanded(
                              flex: 2,
                              child: DetailsCancelButtonWidget(
                                  iconSize: 10,
                                  size: 8,
                                  onPressed: () => showDialog(
                                      context: context,
                                      builder: (context) =>
                                          DetailsCancelPopUpWidget(
                                              order: OrderEntity(
                                                  id: widget.order.idPedido,
                                                  title: widget
                                                      .order.pedido.titulo,
                                                  environments: "",
                                                  status: order.status),
                                              cancelOrder: () =>
                                                  store.cancelOrder(
                                                      order: order,
                                                      context: context)))),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  DetailsSuportButtonWidget(
                                      size: 12,
                                      onPressed: () => Modular.to.pushNamed(
                                          RouterGlobalMapper.chatSupport,
                                          arguments: OrderEntity(
                                              id: widget.order.idPedido,
                                              title: widget.order.pedido.titulo,
                                              environments: "",
                                              status: widget.order.status))),
                                  PaymentButtonWidget(
                                      onPressed: () => Modular.to.pushNamed(
                                          CustomerRouters.paymentProposalIntern,
                                          arguments: widget.order.idProposta))
                                ],
                              ),
                            )
                          ]),
                      const SizedBox(height: 40.0),
                    ]),
              ),
            )),
      ),
    );
  }
}
