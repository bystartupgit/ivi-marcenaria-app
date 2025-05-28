import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/domain/entities/employee_user_entity.dart';
import 'package:marcenaria/modules/customer/shared/proposal_card/proposal_card_widget.dart';
import 'package:marcenaria/modules/employee/service/presentation/production/details/stores/production_details_store.dart';

import '../../../../../../core/data/router_global_mapper.dart';
import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';
import '../../../../../admin/shared/chat_order_button/chat_order_button_widget.dart';
import '../../../../../admin/shared/chat_order_button/confirmation_button_widget.dart';
import '../../../../../admin/shared/details_card/details_card_widget.dart';
import '../../../../../admin/shared/employee_details_card/employee_details_card_widget.dart';
import '../../../../../customer/home/orders/domain/entities/order_entity.dart';
import '../../../../../customer/home/orders/domain/enum/order_status_enum.dart';
import '../../../../details/presentation/components/indicator_step_employee_widget.dart';

class ProductionDetailsPage extends StatefulWidget {
  final int orderID;

  const ProductionDetailsPage({super.key, required this.orderID});

  @override
  State<ProductionDetailsPage> createState() => _ProductionDetailsPageState();
}

class _ProductionDetailsPageState extends State<ProductionDetailsPage> {
  final ProductionDetailsStore store = Modular.get<ProductionDetailsStore>();

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
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          DetailsCardWidget(
                            order: store.order!,
                            statusColor: const Color(0xFF47A9FF),
                            status: "Em produção",
                          ),
                          const SizedBox(height: 20.0),
                          ProporsalCardWidget(order: store.proposal!),
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
                          const IndicatorStepEmployeeWidget(index: 3),
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
                                        title: "Conversar com suporte",
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
