import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/admin/domain/entities/order_entity.dart';
import 'package:marcenaria/modules/admin/domain/enum/order_status_enum.dart';


class CustomerOrderCardWidget extends StatelessWidget {

  final OrderEntity order;

  const CustomerOrderCardWidget({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: const Color(0xFFECECEC),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
        horizontalTitleGap: 20,
        trailing: const Icon(Icons.arrow_forward_ios,color: Color(0xFF3B3B3B),size: 12.0),
        title: Text(StatusExtension.fromTitle(order.status),style: TextStyle(color: OrderStatus.payment == OrderStatus.production? ColorTheme.lightBlue : ColorTheme.lightGreen,fontSize: 10, fontFamily: FamilyTheme.medium )),
        leading: Text("Orçamento nº ${order.id} ",style: TextStyle(fontFamily: FamilyTheme.regular,color: ColorTheme.black3,fontSize: 14)),
      ),
    );
  }
}
