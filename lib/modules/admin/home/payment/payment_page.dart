import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/admin/domain/enum/order_status_enum.dart';
import 'package:marcenaria/modules/admin/home/payment/stores/payment_store.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/data/router_global_mapper.dart';
import '../../../../core/data/store/core_store.dart';
import '../../../../core/themes/color_theme.dart';
import '../create_proposal/presentation/components/create_proporse_customer_button_widget.dart';
import '../create_proposal/presentation/components/create_proporse_details_card_widget.dart';

class PaymentPage extends StatefulWidget {
  final int orderID;

  const PaymentPage({super.key, required this.orderID});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final PaymentStore store = Modular.get<PaymentStore>();

  @override
  void initState() {
    store.init(orderID: widget.orderID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => ModalProgressHUD(
        inAsyncCall: store.loading,
        child: Scaffold(
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
                      child: Column(children: [
                        CreateProporseDetailsCardWidget(
                            order: store.order!,
                            moreDetails: store.moreDetails,
                            changeMoreDetails: store.changeMoreDetails),
                        const SizedBox(height: 20.0),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            spacing: 10,
                            children: [
                              Expanded(
                                child: CreateProporseCustomerButtonWidget(
                                    size: 12,
                                    onPressed: () => Modular.to.pushNamed(
                                        RouterGlobalMapper.chatSupport,
                                        arguments: OrderEntity(
                                            id: widget.orderID,
                                            title: store.order?.title ?? "",
                                            environments:
                                                store.order?.environments ?? "",
                                            status: store.order?.status ??
                                                OrderStatus.aproval))),
                              ),
                            ]),
                        const SizedBox(height: 40.0),
                      ]),
                    ),
                  )),
      ),
    );
  }
}
