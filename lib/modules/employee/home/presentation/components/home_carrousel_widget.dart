import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/employee/home/presentation/components/home_carrousel_item_widget.dart';

import '../../../../../core/themes/family_theme.dart';

class HomeCarrouselWidget extends StatelessWidget {
  final String title = "Sabia mais sobre nosso app";
  final int index;
  final Function(int index, CarouselPageChangedReason reason) onChanged;

  const HomeCarrouselWidget(
      {super.key, required this.index, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text(title,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: FamilyTheme.regular,
                    color: Colors.black))),
        const SizedBox(height: 2.0),
        CarouselSlider.builder(
            itemCount: 2,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    const HomeCarrouselItemWidget(
                      image: "assets/covers/cover_2.png",
                      title: '',
                      description: '',
                    ),
            options: CarouselOptions(
                onPageChanged: onChanged,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: true,
                height: 140)),
        const SizedBox(height: 5.0),
        DotsIndicator(
            position: index,
            dotsCount: 2,
            decorator: DotsDecorator(
                activeColor: ColorTheme.orange, color: ColorTheme.lightGray2))
      ],
    );
  }
}
