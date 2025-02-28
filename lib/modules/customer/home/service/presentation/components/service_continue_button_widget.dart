import 'package:flutter/material.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/components/service_icons.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class ServiceContinueButtonWidget extends StatelessWidget {

  final String title = "Continue";
  final Function() onPressed;

  const ServiceContinueButtonWidget({ super.key, required this.onPressed });

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                side: BorderSide(color: ColorTheme.orange,width: 1.0),
                borderRadius: BorderRadius.circular(5.0)),
            backgroundColor: ColorTheme.orange, elevation: 0),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 10.0,
            children: [
              Text(title,style: TextStyle(fontSize: 18, fontFamily: FamilyTheme.regular, color: Colors.white)),
              const Icon(ServiceIcons.arrow,color: Colors.white)
            ],
          ),
        ));
  }
}
