import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:marcenaria/core/data/router_global_mapper.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/customer/navigation/presentation/stores/navigation_store.dart';
import 'package:marcenaria/modules/employee/domain/mappers/home_title_mapper.dart';
import 'package:marcenaria/modules/employee/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/employee/navigation/components/drawer_icons.dart';
import 'package:marcenaria/modules/employee/navigation/components/navigation_drawer_option_widget.dart';

import '../../../data/routers/customer_routers.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final NavigationStore store;
  final String logo = "assets/logo/logo.svg";

  const NavigationDrawerWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.5,
        padding:
            EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                topLeft: Radius.circular(50.0)),
            color: ColorTheme.orange),
        child: Column(
          spacing: 10.0,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 50.0),
            SvgPicture.asset(logo,
                width: MediaQuery.of(context).size.width * 0.30),
            const SizedBox(height: 10.0),
            NavigationDrawerOptionWidget(
                icon: DrawerIcons.notification,
                onPressed: () {
                  Navigator.pop(context);
                  Modular.to.pushNamed(RouterGlobalMapper.notification);
                },
                title: HomeTitleMapper.notification),
            Divider(color: Colors.black.withValues(alpha: 0.1)),
            NavigationDrawerOptionWidget(
                icon: DrawerIcons.home,
                onPressed: () {
                  Navigator.pop(context);
                  store.setIndex(0);
                },
                title: HomeTitleMapper.home),
            NavigationDrawerOptionWidget(
                icon: DrawerIcons.calculator,
                onPressed: () {
                  Navigator.pop(context);
                  store.setIndex(1);
                },
                title: HomeTitleMapper.orcamentos),
            NavigationDrawerOptionWidget(
                icon: DrawerIcons.document,
                onPressed: () {
                  Navigator.pop(context);
                  store.setIndex(2);
                },
                title: HomeTitleMapper.orders),
            Divider(color: Colors.black.withValues(alpha: 0.1)),
            NavigationDrawerOptionWidget(
                icon: DrawerIcons.user,
                onPressed: () {
                  Navigator.pop(context);
                  Modular.to.pushNamed(CustomerRouters.profileIntern);
                },
                title: HomeTitleMapper.profile),
            NavigationDrawerOptionWidget(
                icon: DrawerIcons.comment,
                onPressed: () {
                  Navigator.pop(context);
                  store.setIndex(3);
                },
                title: HomeTitleMapper.messages),
            const Expanded(child: SizedBox(height: 10.0)),
            NavigationDrawerOptionWidget(
                icon: DrawerIcons.exit,
                onPressed: () {
                  Navigator.pop(context);
                  Modular.to.pushReplacementNamed(RouterGlobalMapper.login);
                },
                title: HomeTitleMapper.exit),
            SizedBox(height: MediaQuery.of(context).padding.bottom)
          ],
        ));
  }
}
