import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/admin/home/proposal/presentation/stores/proposal_store.dart';
import 'package:marcenaria/modules/admin/navigation/stores/navigation_store.dart';
import 'package:marcenaria/modules/customer/navigation/presentation/components/navigation_icons.dart';

import 'home_card_svg_widget.dart';
import 'home_card_widget.dart';

class HomeOrderWidget extends StatelessWidget {

  final NavigationStore store = Modular.get<NavigationStore>();
  final ProposalStore proposal = Modular.get<ProposalStore>();

  final String title = "Pedidos";

  final String waitingApproval = "Aguardando Prestador ";
  final String waitingProporsal = "Recusados";

  HomeOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title,style: TextStyle(fontSize: 14,color: ColorTheme.black3,fontFamily: FamilyTheme.medium)),
          const SizedBox(height: 5.0),
          HomeCardSVGWidget(title: waitingProporsal,onPressed: () { store.setIndex(2);  },icon: "assets/admin/navigation/aguardando.svg"),
          HomeCardSVGWidget(title: waitingApproval,onPressed: () { store.setIndex(2); },icon: "assets/admin/navigation/recusado.svg"),
        ]);
  }
}
