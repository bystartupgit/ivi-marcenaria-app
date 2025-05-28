import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marcenaria/modules/employee/profile/form/presentation/components/profile_attachment_button_widget.dart';

import '../../../../../../core/themes/color_theme.dart';
import '../../../../../../core/themes/family_theme.dart';

class ProfileDocumentWidget extends StatelessWidget {
  final Function() onPressed;
  final List<File?> files;
  final String title;
  final IconData icon;

  const ProfileDocumentWidget(
      {super.key,
      required this.onPressed,
      this.files = const [],
      required this.title,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFFECECEC),
      elevation: 3,
      child: ListTile(
        trailing: Icon(icon,
            color: files.isEmpty ? ColorTheme.gray2 : ColorTheme.orange,
            size: 20),
        subtitle: Row(mainAxisSize: MainAxisSize.min, spacing: 10.0, children: [
          ProfileAttachmentButtonWidget(download: onPressed),
          files.isNotEmpty
              ? Text("imagem.png",
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                      color: ColorTheme.black,
                      fontFamily: FamilyTheme.regular,
                      fontSize: 11))
              : Container()
        ]),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(title,
              style: TextStyle(
                  color: ColorTheme.black,
                  fontFamily: FamilyTheme.regular,
                  fontSize: 11)),
        ),
      ),
    );
  }
}
