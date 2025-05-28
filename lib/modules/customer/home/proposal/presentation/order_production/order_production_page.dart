import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/customer/home/proposal/presentation/order_production/stores/order_production_store.dart';

import '../../../../../../core/data/router_global_mapper.dart';
import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';
import '../../../../../admin/domain/entities/employee_user_entity.dart';
import '../../../../../admin/home/orders/choice_employee/details/select_employee/components/employee_card_widget.dart';
import '../../../../../admin/shared/chat_order_button/chat_order_button_widget.dart';
import '../../../../../admin/shared/details_card/details_card_widget.dart';
import '../../../../../admin/shared/employee_details_card/employee_details_card_widget.dart';
import '../../../../../admin/shared/proposal_payment_card/proposal_payment_card_widget.dart';
import '../../../orders/details/presentation/components/details_indicator_step_widget.dart';
import '../../../orders/domain/entities/order_entity.dart';
import '../../../orders/domain/enum/order_status_enum.dart';

class OrderProductionPage extends StatefulWidget {
  final int orderID;

  const OrderProductionPage({super.key, required this.orderID});

  @override
  State<OrderProductionPage> createState() => _OrderProductionPageState();
}

class _OrderProductionPageState extends State<OrderProductionPage> {
  final OrderProductionStore store = Modular.get<OrderProductionStore>();

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
                          Text("Detalhe do Pagamento",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: FamilyTheme.medium,
                                  color: ColorTheme.black3,
                                  fontSize: 12)),
                          const SizedBox(height: 5.0),
                          ProposalPaymentCardWidget(proposal: store.proposal!),
                          const SizedBox(height: 8.0),
                          Text("Prestador designado",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontFamily: FamilyTheme.medium,
                                  color: ColorTheme.black3,
                                  fontSize: 12)),
                          const SizedBox(height: 8.0),
                          EmployeeDetailsCardWidget(
                              employee: EmployeeUserEntity(
                                  statusContrato: "Ativo",
                                  phone: "",
                                  email: "",
                                  userID: 0,
                                  funcoes: [],
                                  employeeID: 0,
                                  status: false,
                                  name: "Marcenaria")),
                          const SizedBox(height: 20.0),
                          const DetailsIndicatorStepWidget(index: 3),
                          const SizedBox(height: 20.0),
                          SizedBox(
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                spacing: 10,
                                children: [
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
                          ),
                          const SizedBox(height: 40.0),
                        ]),
                  ),
                )),
    );
  }
}
