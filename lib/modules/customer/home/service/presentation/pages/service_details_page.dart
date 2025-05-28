import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/components/service_conclusion_button_widget.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/components/service_observation_widget.dart';

import '../components/service_cover_selector_widget.dart';
import '../components/service_type_widget.dart';
import '../stores/service_store.dart';

class ServiceDetailsPage extends StatelessWidget {
  final ServiceStore store;

  const ServiceDetailsPage({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          ServiceTypeWidget(store: store),
          const SizedBox(height: 10.0),
          ServiceObservationWidget(
              onChanged: store.setObservations,
              setWhatsapp: store.setWhatsApp,
              whatsapp: store.whatsapp),
          const SizedBox(height: 10.0),
          ServiceCoverSelectorWidget(store: store),
          const SizedBox(height: 30.0),
          ServiceConclusionButtonWidget(
              onPressed: () => store.saveService(context: context)),
          const SizedBox(height: 40.0),
        ]),
      ),
    );
  }
}
