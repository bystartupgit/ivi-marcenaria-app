import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/customer/home/profile/domain/dtos/profile_dto.dart';
import 'package:marcenaria/modules/customer/home/profile/presentation/components/profile_edit_button_widget.dart';
import 'package:marcenaria/modules/customer/home/profile/presentation/components/profile_image_widget.dart';
import 'package:marcenaria/modules/customer/home/profile/presentation/stores/profile_store.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../../../core/themes/family_theme.dart';
import 'components/profile_back_button_widget.dart';
import 'components/profile_icons.dart';
import 'components/profile_read_field_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ProfileStore store = Modular.get<ProfileStore>();
  final String title = "Perfil";

  @override
  void initState() {
    store.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return ModalProgressHUD(
        inAsyncCall: store.loading,
        child: Scaffold(
            backgroundColor: ColorTheme.background,
            appBar: AppBar(
                backgroundColor: ColorTheme.background,
                title: Text(title,
                    style: TextStyle(
                        color: ColorTheme.black3,
                        fontSize: 20,
                        fontFamily: FamilyTheme.regular)),
                leading: const ProfileBackButtonWidget()),
            body: SingleChildScrollView(
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(spacing: 10.0, children: [
                      ProfileImageWidget(
                          name: store.name.text,
                          pathImage: store.pathImage,
                          image: store.image,
                          uploadImage: () =>
                              store.uploadImage(context: context)),
                      const SizedBox(height: 20.0),
                      Align(
                          alignment: AlignmentDirectional.topEnd,
                          child: ProfileEditButtonWidget(
                              update: (ProfileDTO value) {
                            store.update(value);
                            setState(() {});
                          })),
                      ProfileReadFieldWidget(
                          hint: "exemplo@exemplo.com",
                          keyboard: TextInputType.emailAddress,
                          icon: ProfileIcons.email,
                          controller: store.email),
                      ProfileReadFieldWidget(
                          hint: "(DDD) Numero",
                          keyboard: TextInputType.number,
                          icon: ProfileIcons.phone,
                          controller: store.phone),
                      ProfileReadFieldWidget(
                          hint: "CPF ou RG",
                          keyboard: TextInputType.number,
                          icon: ProfileIcons.cpf,
                          controller: store.documentNumber),
                    ])))),
      );
    });
  }
}
