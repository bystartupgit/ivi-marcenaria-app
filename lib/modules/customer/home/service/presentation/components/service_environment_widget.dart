import 'package:flutter/material.dart';
import 'package:marcenaria/modules/customer/home/service/domain/mappers/environment_mapper.dart';
import 'package:marcenaria/modules/customer/home/service/presentation/stores/service_store.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';
import 'service_Card_environment_widget.dart';

class ServiceEnvironmentWidget extends StatelessWidget {

  final ServiceStore store;

  final String title = "Quais ambientes vamos criar?";
  final String description = "Escolha os ambientes que deseja reformar ou criar móveis.";

  const ServiceEnvironmentWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: ColorTheme.gray,
                blurRadius: 4.0, offset: const Offset(0.0, 5.0))],
            color: ColorTheme.lightGray,
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title,style: TextStyle(fontSize: 18,color: ColorTheme.title,fontFamily: FamilyTheme.bold)),
              const SizedBox(height: 2.0),
              Text(description, style: TextStyle(fontSize: 12,color: ColorTheme.title,fontFamily: FamilyTheme.regular)),
              const SizedBox(height: 10.0),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width:  MediaQuery.of(context).size.width,
                child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    childAspectRatio: 1.5,
                    padding: EdgeInsets.zero,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    crossAxisCount: 3,
                  children: [
                    ServiceCardEnvironmentWidget(title: EnvironmentMapper.living, image: EnvironmentMapper.livingImage, store: store),
                    ServiceCardEnvironmentWidget(title: EnvironmentMapper.kitchen, image: EnvironmentMapper.kitchenImage, store: store),
                    ServiceCardEnvironmentWidget(title: EnvironmentMapper.bathroom, image: EnvironmentMapper.bathroomImage, store: store),

                    ServiceCardEnvironmentWidget(title: EnvironmentMapper.bedroom, image: EnvironmentMapper.bedroomImage, store: store),
                    ServiceCardEnvironmentWidget(title: EnvironmentMapper.dining, image: EnvironmentMapper.diningImage, store: store),
                    ServiceCardEnvironmentWidget(title: EnvironmentMapper.service, image: EnvironmentMapper.serviceImage, store: store),

                    ServiceCardEnvironmentWidget(title: EnvironmentMapper.balcony ,image: EnvironmentMapper.balconyImage, store: store),
                    ServiceCardEnvironmentWidget(title: EnvironmentMapper.reform, image: EnvironmentMapper.reformImage, store: store),
                    ServiceCardEnvironmentWidget(title: EnvironmentMapper.other, image: EnvironmentMapper.otherImage, store: store),
                  ]
                ),
              ),
    ]));
  }
}
