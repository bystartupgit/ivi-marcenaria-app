import 'package:flutter/material.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class ServiceObservationWidget extends StatelessWidget {

  final String title = "Gostaria de adicionar alguma observação?";
  final String description = "Sinta-se à vontade para compartilhar mais detalhes!";

  final String checkDescription = "Deseja receber um contato via WhatsApp?";

  final bool whatsapp;
  final int maxLength = 650;

  final Function(String value) onChanged;
  final Function(bool? value) setWhatsapp;

  const ServiceObservationWidget({ super.key,
    required this.whatsapp, required this.onChanged, required this.setWhatsapp });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: ColorTheme.lightGray,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(10.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 18,
                  color: ColorTheme.title,
                  fontFamily: FamilyTheme.bold)),
              const SizedBox(height: 2.0),
              Text(description, style: TextStyle(fontSize: 12,
                  color: ColorTheme.title,
                  fontFamily: FamilyTheme.regular)),
              const SizedBox(height: 5.0),
              Container(
                  decoration: BoxDecoration(
                    color: ColorTheme.background,
                    borderRadius: BorderRadius.circular(10.0),),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                          style: TextStyle(color: ColorTheme.gray,
                              fontSize: 16,
                              fontFamily: FamilyTheme.regular),
                          onChanged: onChanged,
                          maxLength: maxLength,
                          maxLines: 1,
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorTheme.search,
                              counterStyle: TextStyle(fontFamily: FamilyTheme.regular,color: ColorTheme.description,fontSize: 10),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: ColorTheme.search)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(color: ColorTheme.search)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                      color: ColorTheme.search)))),

                    ])),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 5.0,
                children: [
                  SizedBox(
                    width: 20,
                    child: Checkbox(value: whatsapp, onChanged: setWhatsapp,
                        activeColor: ColorTheme.orange,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
                  ),
                  Text(checkDescription,style: TextStyle(color: ColorTheme.black3,fontSize: 12,fontFamily: FamilyTheme.regular))
                ],
              )
            ]),
      ),
    );
  }
}
