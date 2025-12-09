import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/admin/home/create_order_from_customer/stores/create_order_from_customer_store.dart';
import 'package:marcenaria/modules/login/shared/components/document_textfield_widget.dart';
import 'package:marcenaria/modules/login/shared/components/email_textfield_widget.dart';
import 'package:marcenaria/modules/login/shared/components/login_icons.dart';
import 'package:marcenaria/modules/login/shared/components/name_textfield_widget.dart';
import 'package:marcenaria/modules/login/shared/components/password_textfield_widget.dart';
import 'package:marcenaria/modules/login/shared/components/phone_textfield_widget.dart';

class CreateCustomerModalWidget extends StatelessWidget {
  final CreateOrderFromCustomerStore store;
  final BuildContext pageContext;

  const CreateCustomerModalWidget({
    super.key,
    required this.store,
    required this.pageContext,
  });

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.8,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Criar Novo Cliente",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: FamilyTheme.medium,
                      color: ColorTheme.black3,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      store.setShowCreateCustomerModal(false);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      NameTextFieldWidget(
                        title: "Nome",
                        icon: LoginIcons.user,
                        onChanged: store.setCustomerName,
                      ),
                      const SizedBox(height: 15.0),
                      EmailTextFieldWidget(
                        title: "E-mail",
                        icon: LoginIcons.email,
                        onChanged: store.setCustomerEmail,
                      ),
                      const SizedBox(height: 15.0),
                      PasswordTextFieldWidget(
                        title: "Senha",
                        icon: LoginIcons.password,
                        onChanged: store.setCustomerPassword,
                        changeObscure: () {},
                        isObscure: true,
                      ),
                      const SizedBox(height: 15.0),
                      DocumentTextFieldWidget(
                        title: "CPF",
                        icon: LoginIcons.cpf,
                        onChanged: store.setCustomerCpf,
                      ),
                      const SizedBox(height: 15.0),
                      PhoneTextFieldWidget(
                        title: "Telefone",
                        icon: LoginIcons.whatsapp,
                        onChanged: store.setCustomerPhone,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        store.setShowCreateCustomerModal(false);
                        Navigator.of(context).pop();
                      },
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: Text(
                        "Cancelar",
                        style: TextStyle(
                          fontFamily: FamilyTheme.medium,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: store.loading
                          ? null
                          : () async {
                              await store.createCustomer(context, pageContext);
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorTheme.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      child: store.loading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : Text(
                              "Criar",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: FamilyTheme.medium,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

