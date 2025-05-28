import 'package:flutter/material.dart';
import 'package:marcenaria/modules/employee/details/presentation/components/details_cancel_button_widget.dart';
import 'package:marcenaria/modules/employee/details/presentation/components/details_finish_button_widget.dart';

import 'details_suport_button_widget.dart';

class DetailsProgressActionWidget extends StatelessWidget {
  final String title;

  final Function() cancel;
  final Function() action;

  const DetailsProgressActionWidget(
      {super.key,
      required this.title,
      required this.cancel,
      required this.action});

  @override
  Widget build(BuildContext context) {
    return Row(
        spacing: 20.0,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          DetailsCancelButtonWidget(onPressed: () {}),
          Expanded(
              child: Column(
            spacing: 5.0,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DetailsSuportButtonWidget(),
              DetailsFinishButtonWidget(title: title, onPressed: () {}),
            ],
          ))
        ]);
  }
}
