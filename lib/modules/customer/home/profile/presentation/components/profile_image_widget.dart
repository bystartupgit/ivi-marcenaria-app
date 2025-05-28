import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/core/themes/family_theme.dart';
import 'package:marcenaria/modules/customer/home/profile/presentation/utils/profile_utils.dart';

import '../../../../../../core/environments/app_environments.dart';
import 'edit_icons.dart';

class ProfileImageWidget extends StatelessWidget {
  final File? image;
  final String? pathImage;

  final Function() uploadImage;
  final String name;

  const ProfileImageWidget(
      {super.key,
      this.image,
      this.pathImage,
      required this.name,
      required this.uploadImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 10.0,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: uploadImage,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                  width: 74,
                  height: 74,
                  decoration: BoxDecoration(
                      color: ColorTheme.darkGray,
                      image: image == null
                          ? pathImage == null
                              ? null
                              : DecorationImage(
                                  image: NetworkImage(
                                      AppEnvironments.base + pathImage!),
                                  fit: BoxFit.cover,
                                  onError: (e, s) => Container())
                          : DecorationImage(
                              image: FileImage(image!), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: image != null || pathImage != null
                      ? null
                      : Center(
                          child: Text(ProfileUtils.initalLetters(name),
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.08,
                                  fontFamily: FamilyTheme.regular,
                                  color: Colors.black)))),
              Positioned(
                bottom: -5,
                right: -8,
                child: Container(
                  decoration: BoxDecoration(
                      color: ColorTheme.lightGray, shape: BoxShape.circle),
                  child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Icon(EditIcons.edit, size: 10)),
                ),
              )
            ],
          ),
        ),
        Text(name,
            style: TextStyle(
                color: Colors.black,
                fontFamily: FamilyTheme.medium,
                fontSize: 16))
      ],
    );
  }
}
