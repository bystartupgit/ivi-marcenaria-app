import 'package:flutter/material.dart';
import 'package:marcenaria/core/data/enums/order_status_enum.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/employee/details/presentation/components/details_card_widget.dart';
import 'package:marcenaria/modules/employee/details/presentation/components/details_historic_button_widget.dart';
import 'package:marcenaria/modules/employee/details/presentation/components/indicator_step_widget.dart';

import 'components/details_back_button_widget.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme.background,
      appBar: AppBar(
        backgroundColor: ColorTheme.background,
        leading: const DetailsBackButtonWidget()),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
              spacing: 20.0,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DetailsCardWidget(),
                IndicatorStepWidget(current: OrderStatus.start),
                if(OrderStatus.completed == OrderStatus.completed) DetailsHistoricButtonWidget()
              ]),
        ));
  }
}
