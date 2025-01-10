import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/employee/domain/mappers/home_title_mapper.dart';
import 'package:marcenaria/modules/employee/navigation/components/drawer_icons.dart';
import 'package:marcenaria/modules/employee/navigation/components/navigation_drawer_option_widget.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.5,
        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50.0) ,
                topLeft: Radius.circular(50.0)),
            color: ColorTheme.orange),
        child: Column(
          spacing: 10.0,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top + 50.0),
            Text("LOGO", style: TextStyle(color: Colors.white)),
            const SizedBox(height: 10.0),
            NavigationDrawerOptionWidget(icon: DrawerIcons.notification, onPressed: () {}, title: HomeTitleMapper.notification),
            Divider(color: Colors.black.withValues(alpha: 0.1)),
            NavigationDrawerOptionWidget(icon: DrawerIcons.home, onPressed: () {}, title: HomeTitleMapper.home),
            NavigationDrawerOptionWidget(icon: DrawerIcons.calculator, onPressed: () {}, title: HomeTitleMapper.orcamentos),
            NavigationDrawerOptionWidget(icon: DrawerIcons.document, onPressed: () {}, title: HomeTitleMapper.orders),
            Divider(color: Colors.black.withValues(alpha: 0.1)),
            NavigationDrawerOptionWidget(icon: DrawerIcons.user, onPressed: () {}, title: HomeTitleMapper.profile),
            NavigationDrawerOptionWidget(icon: DrawerIcons.comment, onPressed: () {}, title: HomeTitleMapper.messages),
            const Expanded(child: SizedBox(height: 10.0)),
            NavigationDrawerOptionWidget(icon: DrawerIcons.exit, onPressed: () {}, title: HomeTitleMapper.exit),
            SizedBox(height: MediaQuery.of(context).padding.bottom)



          ],
        ));
  }
}
