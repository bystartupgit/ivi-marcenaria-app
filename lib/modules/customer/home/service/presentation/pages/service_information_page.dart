import 'package:flutter/material.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/stores/service_store.dart';

import '../components/service_continue_button_widget.dart';
import '../components/service_environment_widget.dart';
import '../components/service_name_widget.dart';

class ServiceInformationPage extends StatelessWidget {
  final ServiceStore store;

  const ServiceInformationPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        ServiceNameWidget(onChanged: store.setName),
        const SizedBox(height: 10.0),
        ServiceEnvironmentWidget(store: store),
        const SizedBox(height: 30.0),
        ServiceContinueButtonWidget(
            onPressed: () => store.goToDetailsPage(context: context))
      ]),
    );
  }
}
