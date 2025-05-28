import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';

import '../../../../utils/order_util.dart';

class EmployeeContractWidget extends StatelessWidget {
  final String? interestingStatus;

  const EmployeeContractWidget({super.key, required this.interestingStatus});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(OrderUtil.getIconContract(interestingStatus),
            color: OrderUtil.getColorContract(interestingStatus)),
        Text(interestingStatus ?? "pendente",
            style: TextStyle(
                color: OrderUtil.getColorContract(interestingStatus),
                fontFamily: FamilyTheme.regular,
                fontSize: 8.0))
      ],
    );
  }
}
