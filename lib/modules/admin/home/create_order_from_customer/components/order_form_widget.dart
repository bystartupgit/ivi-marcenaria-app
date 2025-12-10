import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/admin/home/create_order_from_customer/components/description_textfield_widget.dart';
import 'package:marcenaria/modules/admin/home/create_order_from_customer/components/environment_card_widget.dart';
import 'package:marcenaria/modules/admin/home/create_order_from_customer/components/title_textfield_widget.dart';
import 'package:marcenaria/modules/admin/home/create_order_from_customer/stores/create_order_from_customer_store.dart';

class OrderFormWidget extends StatelessWidget {
  final CreateOrderFromCustomerStore store;

  const OrderFormWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Dados do Orçamento",
              style: TextStyle(
                fontSize: 10,
                fontFamily: FamilyTheme.regular,
                color: ColorTheme.title,
              ),
            ),
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: ColorTheme.gray,
                    blurRadius: 4.0,
                    offset: const Offset(0.0, 5.0),
                  )
                ],
                color: const Color(0xFFECECEC),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  TitleTextFieldWidget(
                    title: "Título do Orçamento *",
                    description: "Ex: Móveis para sala",
                    icon: Icons.title,
                    onChanged: store.setOrderTitle,
                  ),
                  const SizedBox(height: 15.0),
                  DescriptionTextFieldWidget(
                    title: "Descrição *",
                    description: "Descreva o orçamento...",
                    icon: Icons.description,
                    onChanged: store.setOrderDescription,
                  ),
                  const SizedBox(height: 15.0),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Contato via WhatsApp",
                      style: TextStyle(
                        fontFamily: FamilyTheme.regular,
                        fontSize: 14,
                        color: ColorTheme.title,
                      ),
                    ),
                    value: store.whatsapp,
                    onChanged: store.setWhatsapp,
                    activeColor: ColorTheme.orange,
                  ),
                  const SizedBox(height: 10.0),
                ],
              ),
            ),
            const SizedBox(height: 20),
            EnvironmentCardWidget(store: store),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: store.loading ||
                        store.orderTitle.isEmpty ||
                        store.orderDescription.isEmpty
                    ? null
                    : () => store.createOrder(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorTheme.orange,
                  elevation: 4.0,
                  shadowColor: ColorTheme.gray,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
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
                        "Criar Orçamento e Continuar",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: FamilyTheme.medium,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

