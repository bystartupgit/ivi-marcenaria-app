import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/modules/admin/home/create_proposal/presentation/components/create_proporse_back_button_widget.dart';
import 'package:marcenaria/modules/admin/home/orders/waiting_employee/details/potential_employee/stores/potential_employee_store.dart';
import 'package:marcenaria/modules/admin/home/presentation/components/proposal_filter_widget.dart';
import 'package:marcenaria/modules/admin/shared/chat_order_button/confirmation_button_widget.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../../../core/themes/color_theme.dart';
import '../../../choice_employee/details/select_employee/components/employee_card_widget.dart';

class PotentialEmployeeWidget extends StatefulWidget {
  final int proposalID;

  const PotentialEmployeeWidget({super.key, required this.proposalID});

  @override
  State<PotentialEmployeeWidget> createState() =>
      _PotentialEmployeeWidgetState();
}

class _PotentialEmployeeWidgetState extends State<PotentialEmployeeWidget> {
  final PotentialEmployeeStore store = Modular.get<PotentialEmployeeStore>();

  @override
  void initState() {
    store.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: store.loading
            ? Center(child: CircularProgressIndicator(color: ColorTheme.orange))
            : Column(
                children: [
                  ProposalFilterWidget(
                      onChanged: (value) => store.setFilter(value, context)),
                  const SizedBox(height: 20),
                  Expanded(
                    child: ListView.separated(
                        controller: store.scroll,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 10.0),
                        shrinkWrap: true,
                        itemCount: store.employees.length,
                        itemBuilder: (context, index) =>
                            Observer(builder: (context) {
                              return EmployeeCardWidget(
                                  selected: store.employeeSelected
                                      .contains(store.employees[index]),
                                  select: store.employeeSelected
                                          .contains(store.employees[index])
                                      ? () => store.removeSelection(
                                          store.employees[index])
                                      : () => store
                                          .addSelection(store.employees[index]),
                                  employee: store.employees[index]);
                            })),
                  ),
                  Column(
                    children: [
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                            spacing: 20.0,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Expanded(
                                  flex: 1,
                                  child: CreateProporseBackButtonWidget()),
                              Expanded(
                                  flex: 2,
                                  child: ConfirmationButtonWidget(
                                      onPressed: store.hasEmployeeSelected
                                          ? () => store.save(
                                              context: context,
                                              proposalID: widget.proposalID)
                                          : null,
                                      title: 'Designar prestador',
                                      size: 12))
                            ]),
                      ),
                      const SizedBox(height: 50),
                    ],
                  )
                ],
              ),
      );
    });
  }
}
