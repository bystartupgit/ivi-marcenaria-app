

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/home/customers/profile/stores/profile_store.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/themes/color_theme.dart';
import '../../../../../core/themes/family_theme.dart';
import '../../../../customer/home/profile/domain/dtos/profile_dto.dart';
import '../../../../customer/home/profile/presentation/components/profile_back_button_widget.dart';
import '../../../../customer/home/profile/presentation/components/profile_edit_button_widget.dart';
import '../../../../customer/home/profile/presentation/components/profile_icons.dart';
import '../../../../customer/home/profile/presentation/components/profile_image_widget.dart';
import '../../../../customer/home/profile/presentation/components/profile_read_field_widget.dart';
import '../../../domain/entities/customer_user_entity.dart';
import '../components/customer_order_card_widget.dart';
import '../components/customer_quantity_chart_widget.dart';

class ProfilePage extends StatefulWidget {

  final CustomerUserEntity profile;

  const ProfilePage({super.key, required this.profile});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final ProfileStore store = Modular.get<ProfileStore>();
  final String title = "Perfil";

  @override
  void initState() {
    store.init(customer: widget.profile);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) {
          return ModalProgressHUD(
            inAsyncCall: store.loading,
            child: Scaffold(
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
                                  image: store.image, uploadImage: () => store.uploadImage(context: context,customer: widget.profile)),
                              const SizedBox(height: 20.0),
                              Align(
                                  alignment: AlignmentDirectional.topEnd,
                                  child: ProfileEditButtonWidget(update: (value) { store.update(value); setState(() {

                                  });}, customer: widget.profile)),
                              ProfileReadFieldWidget(
                                  hint: "exemplo@exemplo.com",
                                  keyboard: TextInputType.emailAddress, icon: ProfileIcons.email, controller: store.email),
                              ProfileReadFieldWidget(
                                  hint: "(DDD) Numero",
                                  keyboard: TextInputType.number, icon: ProfileIcons.phone, controller: store.phone),
                              ProfileReadFieldWidget(
                                  hint: "CPF ou RG",
                                  keyboard: TextInputType.number, icon: ProfileIcons.cpf, controller: store.documentNumber),
                              const SizedBox(height: 10.0),
                              CustomerQuantityChartWidget(quantity: store.quantity),
                              const SizedBox(height: 5.0),
                              Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Text("Orçamentos e pedidos",style: TextStyle(fontSize: 10,fontFamily: FamilyTheme.regular,color: ColorTheme.black3))),
                              store.orders.isEmpty ? Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Center(child: Text("Nenhum orçamento ou pedido realizado.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: FamilyTheme.regular, color: ColorTheme.pureBlack, fontSize: 16))),
                              ) : Column(
                                children: store.orders.map((e) => CustomerOrderCardWidget(order: e)).toList(),
                              )
                            ]
                        )))),
          );
        }
    );
  }
}