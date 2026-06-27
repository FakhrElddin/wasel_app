import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wasel_app/core/utils/app_colors.dart';
import 'package:wasel_app/core/utils/app_images.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  final List<String> banners = const [
    AppImages.banner1Image,
    AppImages.banner2Image,
    AppImages.banner3Image,
    AppImages.banner4Image,
    AppImages.banner5Image,
  ];

  CarouselSliderController carouselSliderController = CarouselSliderController();
  int activeIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: carouselSliderController,
          itemCount: banners.length,
          itemBuilder: (context, index, realIndex) => ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              banners[index],
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          options: CarouselOptions(
            height: 200,
            aspectRatio: 16/9,
            autoPlay: true,
            enlargeCenterPage: true,
            autoPlayInterval: Duration(seconds: 3),
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
        SizedBox(
          height: 8,
        ),
        AnimatedSmoothIndicator(
          count: banners.length,
          activeIndex: activeIndex,
          effect: ExpandingDotsEffect(
            dotWidth: 10,
            dotHeight: 10,
            expansionFactor: 3,
            activeDotColor: AppColors.primaryColor,
          ),
          onDotClicked: (index) {
            setState(() {
              carouselSliderController.animateToPage(index);
            });
          },
        ),
      ],
    );
  }
}
