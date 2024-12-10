import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/login/register/presentation/components/documents/presentation/components/document_title_widget.dart';

class DocumentCardWidget extends StatelessWidget {

  final Function() onPressed;

  final String title;
  final String subtitle;

  final String image;
  final String imageAction = "Clique aqui para anexar";

  const DocumentCardWidget({super.key,
    required this.image, required this.onPressed,
    required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: ColorTheme.gray, blurRadius: 4.0, offset: const Offset(0.0, 5.0))],
            color: ColorTheme.lightGray,
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DocumentTitleWidget(title: title, subtitle: subtitle),
              const SizedBox(height: 15.0),

              Center(
                  child: InkWell(
                    onTap: onPressed,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(image),
                        const SizedBox(height: 10.0),
                        Text(imageAction, style: TextStyle(fontFamily: FamilyTheme.regular,fontSize: 12, color: ColorTheme.subtitle))
                      ]),
                  ))
            ]));
  }
}
