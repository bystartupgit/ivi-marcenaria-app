
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/admin/home/customers/components/add_new_customer_widget.dart';
import 'package:marcenaria/modules/admin/home/customers/components/customer_order_card_widget.dart';
import 'package:marcenaria/modules/admin/home/customers/components/user_filter_widget.dart';
import 'package:marcenaria/modules/admin/home/customers/stores/customer_store.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../core/themes/color_theme.dart';
import '../../../../core/themes/family_theme.dart';
import '../../../customer/home/profile/presentation/components/profile_back_button_widget.dart';
import 'components/customer_card_widget.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {

  final String title = "Clientes cadastrados";
  final CustomerStore store = Modular.get<CustomerStore>();

  @override
  void initState() {
    store.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) {
          return ModalProgressHUD(
            inAsyncCall: false,
            child: Scaffold(
                backgroundColor: ColorTheme.background,
                appBar: AppBar(
                    backgroundColor: ColorTheme.background,
                    leading: const ProfileBackButtonWidget()),
                body: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10.0,
                        children: [
                          Text(title, textAlign: TextAlign.start, style: TextStyle(fontFamily: FamilyTheme.medium, color: ColorTheme.black3, fontSize: 20)),
                          UserFilterWidget(onChanged: (value) => store.setFilter(value, context)),
                          const SizedBox(height: 1.0),
                          Center(child: AddNewCustomerWidget(onPressed: () => Modular.to.pushNamed(RouterMapper.register))),
                          Expanded(
                            child: ListView.separated(
                                controller: store.scroll,
                                shrinkWrap: true,
                                itemBuilder: (context,index) => CustomerCardWidget(customer: store.customers[index]),
                                separatorBuilder: (context,index) => const SizedBox(height: 10.0),
                                itemCount: store.customers.length
                            ),
                          )

                        ]
                    ))),
          );
        }
    );
  }
}
