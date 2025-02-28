import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';

class ServiceCoverItemWidget extends StatelessWidget {

  final bool selected;
  final String image;

  final Function() onPressed;

  const ServiceCoverItemWidget({ super.key,
    required this.onPressed, required this.image, required this.selected });

  @override
  Widget build(BuildContext context) {
    return selected ? Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          image: DecorationImage(image: AssetImage(image),fit: BoxFit.cover),
          border: Border.all(color: ColorTheme.orange, width: 3))) :
    InkWell(
      onTap: onPressed,
      child: SizedBox(
        width: 40,
        height: 40,
        child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
            child: Image.asset(image,gaplessPlayback: true,fit: BoxFit.cover)),
      ),
    );
  }
}
