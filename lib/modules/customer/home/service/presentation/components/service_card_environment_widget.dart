import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/stores/service_store.dart';

class ServiceCardEnvironmentWidget extends StatelessWidget {
  
  final String title;
  final String image;

  final ServiceStore store;
  
  const ServiceCardEnvironmentWidget({super.key,
    required this.store, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => InkWell(
        onTap: store.environments.contains(title) ? () => store.removeEnvironment(title) : () => store.addEnvironment(title),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: store.environments.contains(title) ? ColorTheme.orange : ColorTheme.background),
            child: Center(
              child: Column(
                spacing: 5.0,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(image,colorFilter: ColorFilter.mode( store.environments.contains(title) ? Colors.white : ColorTheme.gray2, BlendMode.srcIn)),
                  Text(title,style: TextStyle(color: store.environments.contains(title) ? Colors.white : ColorTheme.gray2,fontFamily: FamilyTheme.regular,fontSize: 10))
                ]
              ))),
      ));
  }
}
