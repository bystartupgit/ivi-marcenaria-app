import 'package:flutter/material.dart';
import 'package:marcenaria/modules/customer/home/orders/details/presentation/components/details_complete_widget.dart';
import 'package:marcenaria/modules/customer/home/orders/details/presentation/components/details_incomplete_widget.dart';
import 'package:marcenaria/modules/customer/home/orders/details/presentation/stores/order_waiting_details_store.dart';
import 'package:marcenaria/modules/customer/home/orders/domain/entities/order_entity.dart';

import '../../../../../../../core/themes/color_theme.dart';
import '../../../../../../../core/themes/family_theme.dart';

class OrderDetailsCardWidget extends StatelessWidget {

  final OrderWaitingDetailsStore store;

  final bool moreDetails;
  final Function() changeMoreDetails;

  final OrderEntity order;

  final String title = "Orçamento Nº";
  final String image = "assets/home/covers/1.jpeg";

  const OrderDetailsCardWidget({super.key,
    required this.store,
    required this.order, required this.changeMoreDetails, required this.moreDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$title ${order.id}", style: TextStyle(fontFamily: FamilyTheme.medium,
              color: ColorTheme.black3,
              fontSize: 20,)),
            Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: ColorTheme.gray,
                          blurRadius: 4.0,
                          offset: const Offset(0.0, 5.0))
                    ],
                    color: const Color(0xFFECECEC),
                    borderRadius: BorderRadius.circular(10.0)),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height * 0.15,
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0)),
                              image: DecorationImage(
                                  image: AssetImage(image), fit: BoxFit.cover,alignment: AlignmentDirectional.topCenter))),
                      AnimatedContainer(
                          duration: const Duration(milliseconds: 300), // Duração da animação
                          curve: Curves.easeInOut,
                          height: moreDetails ? null : null,
                          decoration: BoxDecoration(
                              color: ColorTheme.lightGray,
                              borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(10.0),
                                  bottomLeft: Radius.circular(10.0))),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: moreDetails ?  DetailsCompleteWidget(
                              openFile: store.downloadMedia,
                              file: store.file,
                              type: store.media?.description ?? "",
                              order: order, lessDetails: () => changeMoreDetails()) : DetailsIncompleteWidget(order: order, moreDetails: () => changeMoreDetails()) )
                    ])

            )]);
  }
}
