import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/admin/home/conclusion/conclusion_page.dart';
import 'package:marcenaria/modules/admin/home/conversations/conversations_page.dart';
import 'package:marcenaria/modules/admin/home/conversations/conversations_store.dart';
import 'package:marcenaria/modules/admin/home/orders/order_page.dart';
import 'package:marcenaria/modules/admin/home/presentation/home_page.dart';
import 'package:marcenaria/modules/admin/home/proposal/presentation/proposal_page.dart';
import 'package:marcenaria/modules/admin/navigation/stores/navigation_store.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'components/admin_navigation_icons.dart';
import 'components/navigation_button_widget.dart';
import 'components/navigation_drawer_widget.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final NavigationStore store = Modular.get<NavigationStore>();


  @override
  void initState() {
    store.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) =>
            ModalProgressHUD(
              inAsyncCall: store.loading,
              child: Scaffold(
                  key: _scaffoldKey,
                  resizeToAvoidBottomInset: false,
                  endDrawer: NavigationDrawerWidget(store: store),
                  appBar: AppBar(backgroundColor: ColorTheme.background,
                      actions: [
                        IconButton(onPressed: () =>
                            _scaffoldKey.currentState?.openEndDrawer(),
                            icon: Icon(
                                Icons.menu_rounded, color: ColorTheme.black2,
                                size: 30))
                      ]),
                  bottomNavigationBar: BottomNavigationBar(
                      type: BottomNavigationBarType.fixed,
                      items: [
                        BottomNavigationBarItem(
                            icon: NavigationButtonWidget(
                                icon: AdminNavigationIcons.home,
                                title: "Inicio",
                                selected: store.index == 0,
                                onPress: () => store.setIndex(0)), label: ""),
                        BottomNavigationBarItem(
                            icon: NavigationButtonWidget(
                                icon: AdminNavigationIcons.calculator,
                                title: "Orçamentos",
                                selected: store.index == 1,
                                onPress: () => store.setIndex(1)), label: ""),
                        BottomNavigationBarItem(
                            icon: NavigationButtonWidget(
                                icon: AdminNavigationIcons.orders,
                                title: "Pedidos",
                                selected: store.index == 2,
                                onPress: () => store.setIndex(2)), label: ""),
                        BottomNavigationBarItem(
                            icon: NavigationButtonWidget(
                                icon: AdminNavigationIcons.conclusion,
                                title: "Concluídos",
                                selected: store.index == 3,
                                onPress: () => store.setIndex(3)), label: ""),
                        BottomNavigationBarItem(
                            icon: NavigationButtonWidget(
                                icon: AdminNavigationIcons.message,
                                title: "Mensagens",
                                selected: store.index == 4,
                                onPress: () => store.setIndex(4)), label: ""),
                      ]),
                  body: SizedBox(
                      height: MediaQuery
                          .of(context)
                          .size
                          .height - MediaQuery
                          .of(context)
                          .padding
                          .bottom,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Column(
                        children: [
                          Expanded(
                              child: PageView(
                                  controller: store.controller,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: const [
                                    HomePage(),
                                    ProposalPage(),
                                    OrderPage(),
                                    ConclusionPage(),
                                    ConversationPage()
                                  ])),
                        ],
                      ))),
            ));
  }
}
