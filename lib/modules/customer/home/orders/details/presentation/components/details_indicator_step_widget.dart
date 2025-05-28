import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';

import '../../../../../../../core/data/enums/order_status_enum.dart';
import '../../../../../../../core/themes/color_theme.dart';
import '../../../../../../../core/themes/family_theme.dart';

class DetailsIndicatorStepWidget extends StatelessWidget {
  final int index;

  const DetailsIndicatorStepWidget({super.key, this.index = 0});

  @override
  Widget build(BuildContext context) {
    return AnotherStepper(
      stepperList: [
        StepperData(
            title: StepperText("Orçamento solicitado",
                textStyle: TextStyle(
                    color: index >= 0 ? ColorTheme.black3 : ColorTheme.gray2,
                    fontFamily: FamilyTheme.regular,
                    fontSize: 14)),
            iconWidget: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: index >= 0
                        ? ColorTheme.darkYellow
                        : ColorTheme.lightGray,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(30))))),
        StepperData(
            title: StepperText("Aprovação do Orçamento",
                textStyle: TextStyle(
                    color: index >= 1 ? ColorTheme.black3 : ColorTheme.gray2,
                    fontFamily: FamilyTheme.regular,
                    fontSize: 14)),
            iconWidget: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: index >= 1
                        ? ColorTheme.darkYellow
                        : ColorTheme.lightGray,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(30))))),
        StepperData(
            title: StepperText("Pagamento",
                textStyle: TextStyle(
                    color: index >= 2 ? ColorTheme.black3 : ColorTheme.gray2,
                    fontFamily: FamilyTheme.regular,
                    fontSize: 14)),
            iconWidget: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: index >= 2
                        ? ColorTheme.darkYellow
                        : ColorTheme.lightGray,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(30))))),
        StepperData(
            title: StepperText("Em Produção",
                textStyle: TextStyle(
                    color: index >= 3 ? ColorTheme.black3 : ColorTheme.gray2,
                    fontFamily: FamilyTheme.regular,
                    fontSize: 14)),
            iconWidget: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: index >= 3
                        ? ColorTheme.darkYellow
                        : ColorTheme.lightGray,
                    borderRadius:
                        const BorderRadius.all(Radius.circular(30))))),
        StepperData(
            title: StepperText("Concluído",
                textStyle: TextStyle(
                    color: index >= 4 ? ColorTheme.black3 : ColorTheme.gray2,
                    fontFamily: FamilyTheme.regular,
                    fontSize: 14)),
            iconWidget: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: index >= 4
                        ? ColorTheme.darkYellow
                        : ColorTheme.lightGray,
                    borderRadius: const BorderRadius.all(Radius.circular(30)))))
      ],
      stepperDirection: Axis.vertical,
      inActiveBarColor: ColorTheme.lightGray,
      activeIndex: index,
      activeBarColor: ColorTheme.darkYellow,
      barThickness: 5,
      verticalGap: 5,
      iconWidth: 15,
      iconHeight: 15,
    );
  }
}
