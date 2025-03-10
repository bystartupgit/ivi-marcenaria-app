import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/employee/profile/presentation/components/profile_back_button_widget.dart';
import 'package:marcenaria/modules/employee/profile/presentation/components/profile_click_field_widget.dart';
import 'package:marcenaria/modules/employee/profile/presentation/components/profile_icons.dart';
import 'package:marcenaria/modules/employee/profile/presentation/components/profile_position_widget.dart';
import 'package:marcenaria/modules/employee/profile/presentation/components/profile_read_field_widget.dart';
import 'package:marcenaria/modules/employee/profile/presentation/stores/profile_store.dart';

import '../../../customer/home/profile/presentation/components/profile_image_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final ProfileStore store = Modular.get<ProfileStore>();
  final String title = "Perfil";

  final String documentONE = "Carteira de trabalho";
  final String documentTWO = "Contrato de serviços";

  @override
  void initState() {
    store.init();
    super.initState();
  }

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
                    ProfileImageWidget(name: store.name.text,
                        pathImage: store.pathImage,
                        image: store.image, uploadImage: () => store.uploadImage(context: context)),
                    const SizedBox(height: 20.0),
                    ProfileReadFieldWidget(
                        hint: "exemplo@exemplo.com",
                        keyboard: TextInputType.emailAddress, icon: ProfileIcons.email, controller: store.email),
                    ProfileReadFieldWidget(
                        hint: "(DDD) Numero",
                        keyboard: TextInputType.number, icon: ProfileIcons.phone, controller: store.phone),
                    ProfileReadFieldWidget(
                        hint: "CPF ou RG",
                        keyboard: TextInputType.number, icon: ProfileIcons.cpf, controller: store.documentNumber),
                    ProfileClickFieldWidget(title: documentONE, icon: ProfileIcons.documents),
                    ProfileClickFieldWidget(title: documentTWO, icon: ProfileIcons.file),
                    const ProfilePositionWidget(jobs: [])
                  ]
              ),
            )),
        ),
    );
  }
}
