import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/home/customers/register/stores/customer_register_store.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../../login/shared/components/login_title_widget.dart';
import 'components/customer_card_page.dart';

class CustomerRegisterPage extends StatefulWidget {
  const CustomerRegisterPage({super.key});

  @override
  State<CustomerRegisterPage> createState() => _CustomerRegisterPageState();
}

class _CustomerRegisterPageState extends State<CustomerRegisterPage> {

  final CustomerRegisterStore store = Modular.get<CustomerRegisterStore>();
  final String title = "Criar conta";

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: ColorTheme.background,
        appBar: AppBar(backgroundColor: ColorTheme.background),
        body: ModalProgressHUD(
          inAsyncCall: store.loading,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: LoginTitleWidget(title: title)),
                  const SizedBox(height: 10.0),
                  CustomerCardPage(store: store),


                ]),
          ),
        ),
      ),
    );
  }
}
