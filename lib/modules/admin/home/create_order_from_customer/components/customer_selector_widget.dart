import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/core/environments/app_environments.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/admin/domain/entities/customer_user_entity.dart';
import 'package:marcenaria/modules/admin/home/create_order_from_customer/stores/create_order_from_customer_store.dart';
import 'package:marcenaria/modules/admin/home/customers/components/user_filter_widget.dart';
import 'package:marcenaria/modules/customer/home/profile/presentation/components/profile_icons.dart';
import 'package:marcenaria/modules/customer/home/profile/presentation/utils/profile_utils.dart';

class CustomerSelectorWidget extends StatelessWidget {
  final CreateOrderFromCustomerStore store;

  const CustomerSelectorWidget({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Selecione o Cliente",
            style: TextStyle(
              fontSize: 20,
              fontFamily: FamilyTheme.medium,
              color: ColorTheme.black3,
            ),
          ),
          const SizedBox(height: 20),
          UserFilterWidget(
            onChanged: (value) => store.setSearchFilter(value, context),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () => store.setShowCreateCustomerModal(true),
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorTheme.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            icon: const Icon(Icons.add, color: Colors.white),
            label: Text(
              "Criar Novo Cliente",
              style: TextStyle(
                color: Colors.white,
                fontFamily: FamilyTheme.medium,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: store.loading && store.customers.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : store.customers.isEmpty
                    ? Center(
                        child: Text(
                          "Nenhum cliente encontrado",
                          style: TextStyle(
                            color: ColorTheme.black3,
                            fontFamily: FamilyTheme.regular,
                          ),
                        ),
                      )
                    : ListView.separated(
                        controller: store.scroll,
                        itemCount: store.customers.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final customer = store.customers[index];
                          return _CustomerCard(
                            customer: customer,
                            onTap: () => store.selectCustomer(customer),
                            isSelected: store.selectedCustomer?.customerID ==
                                customer.customerID,
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}

class _CustomerCard extends StatelessWidget {
  final CustomerUserEntity customer;
  final VoidCallback onTap;
  final bool isSelected;

  const _CustomerCard({
    required this.customer,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 3,
        color: isSelected ? ColorTheme.orange.withOpacity(0.2) : const Color(0xFFECECEC),
        child: ListTile(
          horizontalTitleGap: 10,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          trailing: isSelected
              ? Icon(Icons.check_circle, color: ColorTheme.orange, size: 24)
              : const Icon(Icons.arrow_forward_ios,
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
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: customer.image != null
                ? null
                : Center(
                    child: Text(
                      ProfileUtils.initalLetters(customer.name),
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: FamilyTheme.regular,
                        color: Colors.black,
                      ),
                    ),
                  ),
          ),
          title: Text(
            customer.name,
            style: TextStyle(
              color: ColorTheme.black3,
              fontSize: 16,
              fontFamily: FamilyTheme.medium,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(ProfileIcons.email, size: 12, color: ColorTheme.black3),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      customer.email,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: FamilyTheme.regular,
                        color: ColorTheme.black3,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(ProfileIcons.phone, size: 12, color: ColorTheme.black3),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Text(
                      customer.phone,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: FamilyTheme.regular,
                        color: ColorTheme.black3,
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

