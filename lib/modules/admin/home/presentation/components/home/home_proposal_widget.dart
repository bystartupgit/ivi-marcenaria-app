import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/admin/home/proposal/presentation/stores/proposal_store.dart';
import 'package:marcenaria/modules/admin/navigation/stores/navigation_store.dart';
import 'package:marcenaria/modules/customer/navigation/presentation/components/navigation_icons.dart';

import 'home_card_widget.dart';

class HomeProposalWidget extends StatelessWidget {

  final NavigationStore store = Modular.get<NavigationStore>();
  final ProposalStore proposal = Modular.get<ProposalStore>();

  final String title = "Orçamentos";

  final String waitingApproval = "Aguardando Aprovação";
  final String waitingProporsal = "Aguardando Orçamento";

  HomeProposalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,textAlign: TextAlign.center,style: TextStyle(fontSize: 14,color: ColorTheme.black3,fontFamily: FamilyTheme.medium)),
          const SizedBox(height: 5.0),
          HomeCardWidget(title: waitingProporsal,onPressed: () { store.setIndex(1);  },icon: NavigationIcons.calculator),
          HomeCardWidget(title: waitingApproval,onPressed: () { store.setIndex(1); },icon: NavigationIcons.orders),
    ]);
  }
}
