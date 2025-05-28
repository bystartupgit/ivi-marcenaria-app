import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/admin/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/admin/home/proposal/presentation/stores/proposal_store.dart';
import 'package:marcenaria/modules/admin/navigation/stores/navigation_store.dart';
import 'package:marcenaria/modules/customer/navigation/presentation/components/navigation_icons.dart';

import '../../../../../customer/home/profile/presentation/components/profile_icons.dart';
import '../../../../../employee/navigation/components/drawer_icons.dart';
import 'home_card_widget.dart';

class HomeProposalWidget extends StatelessWidget {
  final NavigationStore store = Modular.get<NavigationStore>();
  final ProposalStore proposal = Modular.get<ProposalStore>();

  final String title = "Orçamentos";
  final String register = "Cadastros";

  final String waitingApproval = "Aguardando Aprovação";
  final String waitingProporsal = "Aguardando Orçamento";

  final String customer = "Clientes";
  final String employee = "Prestadores";

  HomeProposalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(title,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 14,
              color: ColorTheme.black3,
              fontFamily: FamilyTheme.medium)),
      const SizedBox(height: 5.0),
      HomeCardWidget(
          title: waitingProporsal,
          onPressed: () {
            store.setIndex(1);
          },
          icon: NavigationIcons.calculator),
      const SizedBox(height: 10.0),
      HomeCardWidget(
          title: waitingApproval,
          onPressed: () {
            store.setIndex(1);
          },
          icon: NavigationIcons.orders),

      const SizedBox(height: 40.0),
      Text(register,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 14,
              color: ColorTheme.black3,
              fontFamily: FamilyTheme.medium)),
      HomeCardWidget(
          title: customer,
          onPressed: () => Modular.to.pushNamed(RouterMapper.customerIntern),
          icon: DrawerIcons.user),
      const SizedBox(height: 10.0),
      // HomeCardWidget(title: employee,onPressed: () { store.setIndex(1); },icon: ProfileIcons.documents)
    ]);
  }
}
