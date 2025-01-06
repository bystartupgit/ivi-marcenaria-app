import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:marcenaria/core/themes/color_theme.dart';
import 'package:marcenaria/modules/employee/home/presentation/components/home_carrousel_item_widget.dart';

class HomeCarrouselWidget extends StatelessWidget {
  const HomeCarrouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.0,
      children: [
        CarouselSlider.builder(
            itemCount: 2,
            itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                const HomeCarrouselItemWidget(image: "assets/covers/cover_2.png"),
          options: CarouselOptions(
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              autoPlay: true, height: 140)),
        DotsIndicator(

            dotsCount: 2,
            decorator: DotsDecorator(activeColor: ColorTheme.orange,color: ColorTheme.lightGray2),

        )

      ],
    );
  }
}
