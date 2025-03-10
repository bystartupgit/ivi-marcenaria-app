import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/customer/home/profile/form/presentation/components/profile_edit_field_widget.dart';
import 'package:marcenaria/modules/customer/home/profile/form/presentation/components/profile_update_button_widget.dart';
import 'package:marcenaria/modules/customer/home/profile/form/presentation/stores/profile_form_store.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';
import '../../../../../login/register/presentation/utils/cpf_formatter_util.dart';
import '../../../../../login/register/presentation/utils/phone_formatter_util.dart';
import '../../../../../login/shared/components/login_icons.dart';
import 'components/profile_edit_image_widget.dart';

class ProfileFormPage extends StatefulWidget {
  const ProfileFormPage({super.key});

  @override
  State<ProfileFormPage> createState() => _ProfileFormPageState();
}

class _ProfileFormPageState extends State<ProfileFormPage> {

  final ProfileFormStore store = Modular.get<ProfileFormStore>();
  final String title = "Perfil";

  @override
  void initState() {
    store.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (_) => ModalProgressHUD(
          inAsyncCall: store.loading,
          child: Scaffold(
              resizeToAvoidBottomInset: true,
              backgroundColor: ColorTheme.background,
              appBar: AppBar(
                  backgroundColor: ColorTheme.background,
                  title: Text(title,style: TextStyle(color: ColorTheme.black3,
                      fontSize: 20,
                      fontFamily: FamilyTheme.regular)),
                  leading: IconButton(onPressed: () => Modular.to.pop(store.profile),
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: ColorTheme.black2))),
              body: SingleChildScrollView(
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                          spacing: 10.0,
                          children: [
                            ProfileEditImageWidget(name: store.name.text,
                                pathImage: store.pathImage,
                                uploadImage: () => store.uploadImage(context: context),image: store.image),
                            const SizedBox(height: 10.0),
                            ProfileEditFieldWidget(
                                label: "nome",
                                hint: "Nome e sobrenome", controller: store.name, icon: LoginIcons.user),
                            ProfileEditFieldWidget(
                                label: "E-mail",keyboard: TextInputType.emailAddress,
                                hint: "Exemplo@exemplo.com", controller: store.email, icon: LoginIcons.email),
                            ProfileEditFieldWidget(
                                formatters:  [
                                  FilteringTextInputFormatter.digitsOnly,
                                  CpfInputFormatter()
                                ],
                                label: "Documento", keyboard: TextInputType.number,
                                hint: "CPF", controller: store.documentNumber, icon: LoginIcons.cpf),
                            ProfileEditFieldWidget(
                                formatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  PhoneNumberFormatter()
                                ],
                                label: "Telefone", keyboard: TextInputType.number,
                                hint: "(DDD) Numero", controller: store.phone, icon: LoginIcons.whatsapp),
                            const SizedBox(height: 30.0),
                            ProfileUpdateButtonWidget(onPress: () => store.update(context: context))


                          ]
                      )))),
        ));
  }
}
