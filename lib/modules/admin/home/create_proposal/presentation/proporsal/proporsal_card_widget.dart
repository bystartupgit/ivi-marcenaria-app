import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/modules/admin/domain/dtos/create_proporsal_dto.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/components/create_proporse_button_widget.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/proporsal/proporsal_complete_widget.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/proporsal/proporsal_incomplete_widget.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/stores/create_proposal_store.dart';

import '../components/create_proporse_back_button_widget.dart';

class ProporsalCardReviewWidget extends StatelessWidget {
  final CreateProposalStore store;

  final File? proposal;

  final String title = "Detalhes do orçamento";
  final CreateProposalDTO dto;

  const ProporsalCardReviewWidget(
      {super.key, required this.dto, this.proposal, required this.store});

  @override
  Widget build(BuildContext context) {
    return Observer(
        builder: (context) => Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                  spacing: 20.0,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AnimatedContainer(
                        duration: const Duration(
                            milliseconds: 300), // Duração da animação
                        curve: Curves.easeInOut,
                        height: store.moreDetails ? null : null,
                        child: store.moreDetails
                            ? ProporsalCompleteWidget(
                                lessDetails: () => store.changeMoreDetails(),
                                store: store,
                                dto: dto,
                                proposal: proposal,
                              )
                            : ProporsalIncompleteWidget(
                                store: store,
                                moreDetails: () => store.changeMoreDetails(),
                                proposal: proposal,
                                dto: dto)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                          spacing: 20.0,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                                flex: 1,
                                child: CreateProporseBackButtonWidget()),
                            Expanded(
                                flex: 2,
                                child: CreateProporseButtonWidget(
                                    onPressed: () => store.createProporsal(
                                        context: context)))
                          ]),
                    )
                  ]),
            ));
  }
}
