import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/data/router_global_mapper.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/admin/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/admin/home/create_order_from_customer/components/create_customer_modal_widget.dart';
import 'package:marcenaria/modules/admin/home/create_order_from_customer/components/customer_selector_widget.dart';
import 'package:marcenaria/modules/admin/home/create_order_from_customer/components/order_form_widget.dart';
import 'package:marcenaria/modules/admin/home/create_order_from_customer/stores/create_order_from_customer_store.dart';
import 'package:marcenaria/modules/customer/home/profile/presentation/components/profile_back_button_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CreateOrderFromCustomerPage extends StatefulWidget {
  const CreateOrderFromCustomerPage({super.key});

  @override
  State<CreateOrderFromCustomerPage> createState() =>
      _CreateOrderFromCustomerPageState();
}

class _CreateOrderFromCustomerPageState
    extends State<CreateOrderFromCustomerPage> {
  final CreateOrderFromCustomerStore store =
      Modular.get<CreateOrderFromCustomerStore>();
  bool _modalShown = false;

  @override
  void initState() {
    super.initState();
    store.init();
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  String _getTitle() {
    switch (store.currentStep) {
      case 0:
        return "Selecionar Cliente";
      case 1:
        return "Criar Pedido";
      default:
        return "Criar Pedido";
    }
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
            leading: store.currentStep == 0
                ? const ProfileBackButtonWidget()
                : IconButton(
                    icon: Icon(Icons.arrow_back_ios_new_rounded,
                        color: ColorTheme.black2),
                    onPressed: () => store.goBack(),
                  ),
            title: Text(
              _getTitle(),
              style: TextStyle(
                color: ColorTheme.black3,
                fontFamily: 'Gotham Medium',
                fontSize: 18,
              ),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: _buildStepContent(),
          ),
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    // Exibe modal de criação de cliente se necessário
    if (store.showCreateCustomerModal && !_modalShown) {
      _modalShown = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (dialogContext) => CreateCustomerModalWidget(
            store: store,
            pageContext: context,
          ),
        ).then((_) {
          _modalShown = false;
        });
      });
    } else if (!store.showCreateCustomerModal) {
      _modalShown = false;
    }

    switch (store.currentStep) {
      case 0:
        return CustomerSelectorWidget(store: store);
      case 1:
        return OrderFormWidget(store: store);
      default:
        return CustomerSelectorWidget(store: store);
    }
  }
}

