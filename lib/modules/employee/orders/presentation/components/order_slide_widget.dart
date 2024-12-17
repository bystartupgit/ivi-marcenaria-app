
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/employee/orders/presentation/stores/order_store.dart';

class OrderSlideWidget extends StatelessWidget {

  final OrderStore store;

  const OrderSlideWidget({ super.key, required this.store });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22,
      child: CustomSlidingSegmentedControl<int>(customSegmentSettings: CustomSegmentSettings(),
        isStretch: true,
        thumbDecoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 4.0, offset: const Offset(0.0, 4.0))],
            borderRadius: BorderRadius.circular(30.0),color: const Color(0xFFFFFFFF)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),color: const Color(0xFFBEBEBE)),
        onValueChanged: store.setIndex,
        children: {
          1 : Text("Em Produção",style: TextStyle(color: store.index ==  1 ? ColorTheme.orange : ColorTheme.inactivate,
              fontSize: 12, fontFamily: store.index ==  1 ? FamilyTheme.bold : FamilyTheme.regular)),
          2 : Text("Concluídos", style: TextStyle(
              color: store.index ==  2 ? ColorTheme.orange : ColorTheme.inactivate, fontSize: 12,
              fontFamily: store.index ==  2 ? FamilyTheme.bold : FamilyTheme.regular)) },
      ),
    );
  }
}
