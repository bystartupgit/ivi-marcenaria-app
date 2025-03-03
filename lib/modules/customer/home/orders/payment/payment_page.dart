import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/customer/home/orders/payment/components/payment_card_information_widget.dart';
import 'package:marcenaria/modules/customer/home/orders/payment/stores/payment_store.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

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
    store.setOrderID(widget.orderID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => ModalProgressHUD(
        inAsyncCall: store.loading,
        child: Scaffold(
          backgroundColor: ColorTheme.background,
          appBar: AppBar(
              backgroundColor: ColorTheme.background,
              leading: IconButton(onPressed: () => Modular.to.pop(),
                  icon: Icon(Icons.arrow_back_ios_new_rounded,color: ColorTheme.black2))),
          body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PaymentCardInformationWidget(option: store.option,
                      onPressed: () => store.confirmPayment(context: context),
                      setOption: store.setOption,hasOption: store.hasOption),
                  SizedBox(height: MediaQuery.of(context).padding.bottom)
                ],
              )),

        ),
      ),
    );
  }
}