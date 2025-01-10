import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/employee/profile/presentation/components/profile_back_button_widget.dart';
import 'package:marcenaria/modules/employee/profile/presentation/components/profile_icons.dart';
import 'package:marcenaria/modules/employee/profile/presentation/components/profile_read_field_widget.dart';
import 'package:marcenaria/modules/employee/profile/presentation/stores/profile_store.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final ProfileStore store = Modular.get<ProfileStore>();
  final String title = "Perfil";

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        backgroundColor: ColorTheme.background,
        appBar: AppBar(
            backgroundColor: ColorTheme.background,
            title: Text(title,style: TextStyle(color: ColorTheme.black3,
                fontSize: 20,
                fontFamily: FamilyTheme.regular)),
            leading: const ProfileBackButtonWidget()),
        body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                  spacing: 10.0,
                  children: [
                    ProfileReadFieldWidget(keyboard: TextInputType.emailAddress, icon: ProfileIcons.email, controller: store.email),
                    ProfileReadFieldWidget(keyboard: TextInputType.number, icon: ProfileIcons.phone, controller: store.phone),
                    ProfileReadFieldWidget(keyboard: TextInputType.number, icon: ProfileIcons.cpf, controller: store.documentNumber)
                  ]
              ),
            )),
        ),
    );
  }
}
