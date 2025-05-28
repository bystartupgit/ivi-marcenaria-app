import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/shared/details_card/details_card_widget.dart';
import 'package:marcenaria/modules/customer/home/conclusion/components/rating_model_widget.dart';
import 'package:marcenaria/modules/customer/home/orders/details/presentation/components/details_indicator_step_widget.dart';

import '../../../../../core/data/router_global_mapper.dart';
import '../../../../../core/themes/color_theme.dart';
import '../../../../../core/themes/family_theme.dart';
import '../../../admin/domain/entities/employee_user_entity.dart';
import '../../../admin/shared/chat_order_button/chat_order_button_widget.dart';
import '../../../admin/shared/chat_order_button/confirmation_button_widget.dart';
import '../../../admin/shared/employee_details_card/employee_details_card_widget.dart';
import '../../../admin/shared/proposal_payment_card/proposal_payment_card_widget.dart';
import '../orders/domain/entities/order_entity.dart';
import '../orders/domain/enum/order_status_enum.dart';
import 'conclusion_store.dart';

class ConclusionPage extends StatefulWidget {
  final int orderID;

  const ConclusionPage({super.key, required this.orderID});

  @override
  State<ConclusionPage> createState() => _ConclusionPageState();
}

class _ConclusionPageState extends State<ConclusionPage> {
  final ConclusionStore store = Modular.get<ConclusionStore>();

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
                          DetailsCardWidget(order: store.order!),
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
                          const SizedBox(height: 8.0),
                          store.employees.isEmpty
                              ? const SizedBox()
                              : Column(
                                  spacing: 10,
                                  children: store.employees
                                      .map((e) => EmployeeDetailsCardWidget(
                                          employee: EmployeeUserEntity(
                                              statusContrato: e.statusContrato,
                                              phone: e.phone,
                                              email: e.email,
                                              userID: e.userID,
                                              funcoes: [],
                                              employeeID: e.employeeID,
                                              status: e.status,
                                              name: e.name)))
                                      .toList()),
                          const SizedBox(height: 20.0),
                          const DetailsIndicatorStepWidget(index: 4),
                          const SizedBox(height: 20.0),
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  child: ConfirmationButtonWidget(
                                      size: 12,
                                      title: "Avaliar trabalho",
                                      onPressed: () => showModalBottomSheet(
                                          context: context,
                                          backgroundColor: ColorTheme.lightGray,
                                          isScrollControlled: true,
                                          builder: (context) =>
                                              RatingModelWidget(store: store))),
                                ),
                                Row(children: [
                                  Expanded(
                                    child: ChatOrderButtonWidget(
                                        title:
                                            "Conversar com Marcenaria e suporte",
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
                                ]),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40.0),
                        ]),
                  ),
                )),
    );
  }
}
