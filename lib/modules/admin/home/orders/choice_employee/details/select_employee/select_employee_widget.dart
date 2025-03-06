import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/admin/home/orders/choice_employee/details/select_employee/components/employee_card_widget.dart';
import 'package:marcenaria/modules/admin/home/orders/choice_employee/details/select_employee/stores/select_employee_store.dart';

import '../../../../../shared/chat_order_button/confirmation_button_widget.dart';
import '../../../../create_proposal/presentation/components/create_proporse_back_button_widget.dart';
import '../../../../presentation/components/proposal_filter_widget.dart';

class SelectEmployeeWidget extends StatefulWidget {

  final int proposalID;

  const SelectEmployeeWidget({super.key, required this.proposalID});

  @override
  State<SelectEmployeeWidget> createState() => _SelectEmployeeWidgetState();
}

class _SelectEmployeeWidgetState extends State<SelectEmployeeWidget> {

  final SelectEmployeeStore store = Modular.get<SelectEmployeeStore>();

  @override
  void initState() {
    store.init(proposalID: widget.proposalID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          width:MediaQuery.of(context).size.width ,
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16.0),
          child: Column(
            children: [
              ProposalFilterWidget(onChanged: (value) => store.setFilter(value, context,widget.proposalID)),
              const SizedBox(height: 20),
              store.employees.isEmpty? Expanded(
                child: Center(child: Text("Nenhum prestador demonstrou interesse na proposta no momento.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: FamilyTheme.regular),)),
              ) : Expanded(
                child: ListView.separated(
                    controller: store.scroll,
                    separatorBuilder: (context,index) => const SizedBox(height: 10.0),
                    shrinkWrap: true,
                    itemCount: store.employees.length,
                    itemBuilder: (context,index) => Observer(
                      builder: (context) {
                        return EmployeeCardWidget(
                            selected: store.employeedSelected == store.employees[index],
                            select: store.employees[index].statusInteresse == "interessado" ? store.employeedSelected == store.employees[index] ?
                            () => store.setSelectEmployee(null): () => store.setSelectEmployee(store.employees[index]) : null,
                            employee: store.employees[index]);
                      }
                    )),
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
                              child: ConfirmationButtonWidget(onPressed: store.hasSelected ? () => store.save(context: context, proposalID: widget.proposalID) : null, title: 'Designar prestador', size: 12))
                        ]),
                  ),
                  const SizedBox(height: 50),
                ],
              )
            ],
          ),
        );
      }
    );
  }
}