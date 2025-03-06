import 'package:flutter/material.dart';
import 'package:marcenaria/modules/admin/domain/entities/employee_user_entity.dart';

import '../../../../../../../../core/themes/color_theme.dart';
import '../../../../../../../../core/themes/family_theme.dart';
import 'employee_contract_widget.dart';

class EmployeeCardWidget extends StatelessWidget {

  final EmployeeUserEntity employee;
  final Function()? select;
  final bool selected;

  const EmployeeCardWidget({super.key, required this.employee, required this.select, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: select,
      child: Container(
          height: 85,
          decoration: BoxDecoration(
              boxShadow: [BoxShadow(color: ColorTheme.gray, blurRadius: 4.0, offset: const Offset(0.0, 5.0))],
              color: const Color(0xFFECECEC),
              border: selected? Border.all(color:ColorTheme.orange,width: 2) : null,
              borderRadius: BorderRadius.circular(10.0)),
          child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        width: 50,
                        decoration: const BoxDecoration(
                            image: DecorationImage(image: AssetImage("assets/covers/cover_1.png"),fit: BoxFit.cover),
                            borderRadius: BorderRadius.all(Radius.circular(10.0))))),
                Expanded(
                    flex: 3,
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(employee.name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1, style: TextStyle(
                                      fontFamily: FamilyTheme.medium,
                                      color: Colors.black, fontSize: 10)),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text("Trabalhos realizados: 0", style: TextStyle(
                                          fontFamily: FamilyTheme.regular, color: ColorTheme.pureBlack, fontSize: 10)),
                                      const SizedBox(height: 3.0),
                                      Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: List.generate(5, (index)  => const Icon(Icons.star_border,size: 12,))),
                                      const SizedBox(height: 2.0),
                                      Text("Localização: -", style: TextStyle(
                                          fontFamily: FamilyTheme.regular, color: ColorTheme.pureBlack, fontSize: 10)),
                                    ],
                                  ),
                                  EmployeeContractWidget(interestingStatus: employee.statusInteresse)
                                ],
                              ),

                            ])

                    ))
              ])),
    );
  }
}
