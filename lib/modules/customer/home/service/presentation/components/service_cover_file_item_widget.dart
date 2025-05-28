import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../../core/themes/color_theme.dart';

class ServiceCoverFileItemWidget extends StatelessWidget {
  final bool selected;
  final File image;

  final Function() onPressed;

  const ServiceCoverFileItemWidget(
      {super.key,
      required this.onPressed,
      required this.image,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    return selected
        ? Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                image:
                    DecorationImage(image: FileImage(image), fit: BoxFit.cover),
                border: Border.all(color: ColorTheme.orange, width: 3)))
        : InkWell(
            onTap: onPressed,
            child: SizedBox(
              width: 40,
              height: 40,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.file(image,
                      gaplessPlayback: true, fit: BoxFit.cover)),
            ),
          );
  }
}
