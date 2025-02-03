import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/customer/data/routers/customer_routers.dart';

import '../../../../../core/themes/family_theme.dart';

class HomeCardServiceWidget extends StatelessWidget {

  final String image;
  final String title;
  final String description;

  const HomeCardServiceWidget({super.key,
    required this.image,
    required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to.pushNamed(CustomerRouters.serviceIntern),
      child: Card(
        elevation: 2,
        child: Column(
            spacing: 5.0,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0),

                      ))),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(title,
                          style: TextStyle(
                              fontFamily: FamilyTheme.medium,
                              color: Colors.black, fontSize: 16)),
                      Text(description,
                          style: TextStyle(
                              fontFamily: FamilyTheme.regular,
                              color: Colors.black, fontSize: 10)),
                    ])),
              const SizedBox(height: 10.0)
            ]),
      ));
  }
}
