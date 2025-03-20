import '../../../../core/themes/color_theme.dart';
import '../../../../core/themes/family_theme.dart';
import '../../domain/entities/employee_user_entity.dart';

import 'package:flutter/material.dart';

class EmployeeDetailsCardWidget extends StatelessWidget {

  final EmployeeUserEntity employee;

  const EmployeeDetailsCardWidget({super.key, required this.employee });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 120,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: ColorTheme.gray, blurRadius: 2.0, offset: const Offset(0.0, 5.0))],
            color: const Color(0xFFECECEC),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                      width: 80,
                      decoration: const BoxDecoration(
                          image: DecorationImage(image: AssetImage("assets/covers/cover_1.png"),fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(10.0))))),
              Expanded(
                  flex: 4,
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
                                    color: Colors.black, fontSize: 16)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("Trabalhos realizados: 0", style: TextStyle(
                                        fontFamily: FamilyTheme.regular, color: ColorTheme.pureBlack, fontSize: 12)),
                                    const SizedBox(height: 3.0),
                                    Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: List.generate(5, (index)  => const Icon(Icons.star,size: 20,color: Colors.grey,))),
                                    const SizedBox(height: 5.0),
                                    Text("Localização: -", style: TextStyle(
                                        fontFamily: FamilyTheme.regular, color: ColorTheme.pureBlack, fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),

                          ])

                  ))
            ]));
  }
}