
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/modules/admin/domain/dtos/create_proporsal_dto.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/proporsal/proporsal_complete_widget.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/proporsal/proporsal_incomplete_widget.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/proporsal/proposal_rich_title_widget.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/stores/create_proposal_store.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class ProporsalCardReviewWidget extends StatelessWidget {

  final CreateProposalStore store;

  final File? proposal;

  final String title = "Detalhes do orçamento";
  final CreateProposalDTO dto;

  const ProporsalCardReviewWidget({super.key, required this.dto, this.proposal, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
        child: Column(
          spacing: 5.0,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AnimatedContainer(
                duration: const Duration(milliseconds: 300), // Duração da animação
                curve: Curves.easeInOut,
                height: store.moreDetails ? null : null,
                child: store.moreDetails ?
                ProporsalCompleteWidget(lessDetails: () => store.changeMoreDetails(),store: store,dto: dto, proposal: proposal,) :
                ProporsalIncompleteWidget(store: store, moreDetails: () => store.changeMoreDetails(), proposal: proposal, dto: dto)),
            Row(children: [

            ])
      ]),
    ));
  }
}
