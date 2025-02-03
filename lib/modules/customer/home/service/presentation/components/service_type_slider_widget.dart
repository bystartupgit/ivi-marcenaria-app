import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/stores/service_store.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';
import '../../domain/mappers/service_type_mapper.dart';

class ServiceTypeSliderWidget extends StatelessWidget {

  final ServiceStore store;

  const ServiceTypeSliderWidget({ super.key, required this.store });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => SizedBox(
        height: 22,
        child: CustomSlidingSegmentedControl<int>(customSegmentSettings: CustomSegmentSettings(),
          isStretch: true,
          thumbDecoration: BoxDecoration(
              boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.3), blurRadius: 4.0, offset: const Offset(0.0, 4.0))],
              borderRadius: BorderRadius.circular(30.0),color: const Color(0xFFECECEC)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),color: const Color(0xFFBEBEBE)),
          onValueChanged: store.setType,
          children: {
            1 : Text(ServiceTypeMapper.inspiration,
                style: TextStyle(
                    color: store.type ==  1 ? ColorTheme.orange : ColorTheme.inactivate,
                    fontSize: 12, fontFamily: store.type ==  1 ? FamilyTheme.bold : FamilyTheme.bold)),
            2 : Text(ServiceTypeMapper.archtectonic, style: TextStyle(
                color: store.type ==  2 ? ColorTheme.orange : ColorTheme.inactivate, fontSize: 12,
                fontFamily: store.type ==  2 ? FamilyTheme.bold : FamilyTheme.bold)) },
        ),
      ),
    );
  }
}
