import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/themes/color_theme.dart';

class ServiceIndicatorPageWidget extends StatelessWidget {
  final int index;

  const ServiceIndicatorPageWidget({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.3,
      child: AnotherStepper(
        stepperList: [
          StepperData(
              iconWidget: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: index >= 0
                          ? ColorTheme.darkYellow
                          : ColorTheme.lightGray,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))))),
          StepperData(
              iconWidget: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: index >= 1
                          ? ColorTheme.darkYellow
                          : ColorTheme.lightGray,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))))),
        ],
        stepperDirection: Axis.horizontal,
        inActiveBarColor: ColorTheme.lightGray,
        activeIndex: index,
        activeBarColor: ColorTheme.darkYellow,
        barThickness: 5,
        inverted: false,
        iconWidth: 15,
        iconHeight: 15,
      ),
    );
  }
}
