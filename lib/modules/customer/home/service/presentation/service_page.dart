import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/components/service_indicator_page_widget.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/components/service_title_widget.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/pages/service_details_page.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/pages/service_information_page.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/stores/service_store.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/themes/color_theme.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {

  final ServiceStore store = Modular.get<ServiceStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => ModalProgressHUD(
        inAsyncCall: store.loading,
        child: Scaffold(
            backgroundColor: ColorTheme.background,
            appBar: AppBar(
                leading: IconButton(onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios_new_rounded, size: 20,color: ColorTheme.black)),
                backgroundColor: ColorTheme.background),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ServiceTitleWidget(),
                  const SizedBox(height: 10.0),
                  Center(child: ServiceIndicatorPageWidget(index: store.index)),
                  const SizedBox(height: 10.0),
                  Expanded(
                    child: PageView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: store.controller,
                        children: [
                          ServiceInformationPage(store: store),
                          ServiceDetailsPage(store: store)
                        ]
                    ))
                ]))
        ),
      ));
  }
}
