import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/proporsal/proporsal_download_button_widget.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/proporsal/proposal_rich_title_widget.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';
import '../../../../domain/dtos/create_proporsal_dto.dart';
import '../stores/create_proposal_store.dart';

class ProporsalCompleteWidget extends StatelessWidget {

  final Function() lessDetails;

  final CreateProposalStore store;

  final File? proposal;

  final String title = "Detalhes do orçamento";
  final CreateProposalDTO dto;

  const ProporsalCompleteWidget({super.key, required this.store,
    required this.lessDetails,
    this.proposal, required this.dto,});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Container(
          decoration: BoxDecoration(
              color: ColorTheme.lightGray,
              borderRadius: const BorderRadius.all(Radius.circular(10.0))),
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style: TextStyle(color: ColorTheme.black3, fontFamily: FamilyTheme.light, fontSize: 15)),
                const SizedBox(height: 10.0),
                if(proposal != null) ProporsalDownloadButtonWidget(onPressed: () => store.download()),
                Row(
                  spacing: 5.0,
                  children: [
                    Text("R\$${dto.fromTo == null? store.formatValues(dto.totalValue) : store.formatValues(dto.fromTo!)}",overflow: TextOverflow.ellipsis, style: TextStyle(fontFamily: FamilyTheme.bold, color: Colors.black, fontSize: 30)),
                    if(dto.fromTo != null) Text("R\$${store.formatValues(dto.totalValue)}", style: TextStyle(fontFamily: FamilyTheme.regular, color: Colors.black, fontSize: 10,decoration: TextDecoration.lineThrough)),
                  ],
                ),
                Row(
                  spacing: 10.0,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("${dto.discountValue.toStringAsFixed(0)}% de desconto", style: TextStyle(fontFamily: FamilyTheme.bold, color: Colors.black, fontSize: 16)),
                    Text("A vista - PIX", style: TextStyle(fontFamily: FamilyTheme.regular, color: Colors.black, fontSize: 10)),
                  ],
                ),
                if(store.temporal == "SIM") Text("Preço por tempo Limitado!", style: TextStyle(fontFamily: FamilyTheme.medium, color: Colors.red, fontSize: 12)),
                if(dto.valueParcel != null) Text("ou entrada + Parcelado: 1x ${"R\$ ${store.formatValues(dto.totalValue)}"} + ${dto.parcels}x ${"R\$ ${store.formatValues(dto.valueParcel!)}"}",  style: TextStyle(fontFamily: FamilyTheme.regular, color: Colors.black, fontSize: 10)),
                const SizedBox(height: 10.0),
                Text(dto.message, textAlign: TextAlign.left, style: TextStyle(fontFamily: FamilyTheme.regular, color: Colors.black, fontSize: 14)),
                const SizedBox(height: 10.0),
                ProposalRichTitleWidget(total: "R\$ ${store.formatValues(dto.totalValue)}"),
                Center(
                  child: InkWell(
                    onTap: lessDetails,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("Ocultar detalhes",style: TextStyle(
                            color: ColorTheme.description,
                            fontSize: 10,
                            fontFamily:FamilyTheme.medium)),
                        Icon(Icons.keyboard_arrow_up_rounded,color: ColorTheme.description)
                      ],
                    ),
                  ),
                )
              ])),
    );
  }
}
