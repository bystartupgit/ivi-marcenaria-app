import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/environments/app_environments.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/admin/domain/entities/customer_user_entity.dart';
import 'package:marcenaria/modules/admin/domain/mappers/router_mapper.dart';
import 'package:marcenaria/modules/admin/home/customers/components/user_data_row_widget.dart';
import 'package:marcenaria/modules/login/domain/enums/user_type_enum.dart';
import '../../../../../core/data/router_global_mapper.dart';
import '../../../../customer/home/profile/presentation/components/profile_icons.dart';
import '../../../../customer/home/profile/presentation/utils/profile_utils.dart';

class CustomerCardWidget extends StatelessWidget {
  final CustomerUserEntity customer;

  const CustomerCardWidget({super.key, required this.customer});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Modular.to
          .pushNamed(RouterMapper.customerProfileIntern, arguments: customer),
      child: Card(
        elevation: 3,
        color: const Color(0xFFECECEC),
        child: ListTile(
          horizontalTitleGap: 10,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          trailing: const Icon(Icons.arrow_forward_ios,
              color: Color(0xFF3B3B3B), size: 12.0),
          leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  color: ColorTheme.darkGray,
                  image: customer.image != null
                      ? DecorationImage(
                          image: NetworkImage(AppEnvironments.base +
                              customer.image!.split("/").last),
                          fit: BoxFit.cover)
                      : null,
                  borderRadius: BorderRadius.circular(10.0)),
              child: customer.image != null
                  ? null
                  : Center(
                      child: Text(ProfileUtils.initalLetters(customer.name),
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: FamilyTheme.regular,
                              color: Colors.black)))),
          title: Text(customer.name,
              style: TextStyle(
                  color: ColorTheme.black3,
                  fontSize: 16,
                  fontFamily: FamilyTheme.medium)),
          subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                UserDataRowWidget(
                    icon: ProfileIcons.email,
                    placeholder: "email",
                    value: customer.email),
                UserDataRowWidget(
                    icon: ProfileIcons.phone,
                    placeholder: "telefone",
                    value: customer.phone),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UserDataRowWidget(
                        icon: ProfileIcons.cpf,
                        placeholder: "CPF ou RG",
                        value: customer.cpf.isNotEmpty &&
                                UtilBrasilFields.isCPFValido(customer.cpf)
                            ? UtilBrasilFields.obterCpf(customer.cpf)
                            : customer.cpf),
                    InkWell(
                      onTap: () => Modular.to.pushNamed(
                          RouterGlobalMapper.chatPrivateSupport,
                          arguments: [
                            customer.userID,
                            UserType.administrador,
                            UserType.cliente,
                            customer.name
                          ]),
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 4, horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: ColorTheme.orange),
                          child: Center(
                              child: Text("Conversar com Cliente",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: FamilyTheme.medium,
                                      fontSize: 8)))),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
