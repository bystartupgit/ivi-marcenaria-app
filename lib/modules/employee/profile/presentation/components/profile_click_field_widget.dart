import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/employee/profile/presentation/components/profile_download_button_widget.dart';

class ProfileClickFieldWidget extends StatelessWidget {

  final String title;

  final File? attachment;
  final IconData icon;

  const ProfileClickFieldWidget({ super.key,
    required this.title,
    required this.icon, this.attachment });

  @override
  Widget build(BuildContext context) {
    return TextField(
        enabled: false,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(10.0)),
            filled: true,
            prefixIcon: Icon(icon, color: attachment == null ? ColorTheme.gray2 : ColorTheme.orange),
            suffixIcon: attachment == null? null : const ProfileDownloadButtonWidget(),
            suffixIconConstraints: const BoxConstraints(maxHeight: 30),
            hintText: title,
            hintStyle: TextStyle(color: Colors.black,fontFamily: FamilyTheme.regular,fontSize: 14),
            fillColor: ColorTheme.lightGray));
  }
}
