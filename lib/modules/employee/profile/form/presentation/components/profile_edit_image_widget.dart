import 'dart:io';

import 'package:flutter/material.dart';
import 'package:marcenaria/core/environments/app_environments.dart';
import 'package:marcenaria/modules/customer/home/profile/presentation/components/edit_icons.dart';

import '../../../../../../../core/themes/color_theme.dart';
import '../../../../../../../core/themes/family_theme.dart';
import '../../../../../customer/home/profile/presentation/utils/profile_utils.dart';

class ProfileEditImageWidget extends StatelessWidget {

  final String? pathImage;
  final File? image;
  final Function() uploadImage;

  final String subtitle = "Alterar imagem de perfil";
  final String name;

  const ProfileEditImageWidget({super.key,
    this.pathImage, this.image, required this.name, required this.uploadImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 8.0,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: uploadImage,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                width: 74,
                height: 74 ,
                decoration: BoxDecoration(
                    color: ColorTheme.darkGray,
                    image: image == null ? pathImage == null ? null : DecorationImage(image: NetworkImage(AppEnvironments.base + pathImage!),
                        fit: BoxFit.cover, onError:(e,s) => Container()) :
                    DecorationImage(image: FileImage(image!),fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(10.0)),
                child: image != null || pathImage != null ? null :Center(child: Text(ProfileUtils.initalLetters(name),
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.08,fontFamily: FamilyTheme.regular,color: Colors.black)))),
              Positioned(
                bottom: -5,right: -8,
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorTheme.lightGray,
                    shape: BoxShape.circle),
                  child: const Padding(padding: EdgeInsets.all(5.0) ,child: Icon(EditIcons.edit,size: 10)),
                ),
              )
            ],
          ),
        ),
        Text(subtitle, style: TextStyle(color: Colors.black, fontFamily: FamilyTheme.regular, fontSize: 10))
      ],
    );
  }
}