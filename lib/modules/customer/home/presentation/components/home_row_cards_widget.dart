import 'package:flutter/material.dart';
import 'package:marcenaria/modules/customer/home/presentation/components/home_card_service_widget.dart';

import '../../../../../core/themes/family_theme.dart';
import '../../domain/mappers/home_create_service_mapper.dart';

class HomeRowCardsWidget extends StatelessWidget {
  final String title = "Solicite seu orçamento agora mesmo";

  const HomeRowCardsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 2.0,
        children: [
          Align(
              alignment: AlignmentDirectional.centerStart,
              child: Text(title,
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: FamilyTheme.regular,
                      color: Colors.black))),
          Row(spacing: 10.0, children: [
            Expanded(
                child: HomeCardServiceWidget(
                    image: "assets/home/customer/create.jpeg",
                    title: HomeCreateServiceMapper.customizeTitle,
                    description: HomeCreateServiceMapper.customizeDescription)),
            Expanded(
                child: HomeCardServiceWidget(
              image: "assets/home/customer/update.jpeg",
              title: HomeCreateServiceMapper.recoveryTitle,
              description: HomeCreateServiceMapper.recoveryDescritpion,
            ))
          ]),
        ],
      ),
    );
  }
}
