import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_house_app/app/data/models/home_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'house_card.dart';

class FeaturedHousesCarousel extends StatefulWidget {
  final List<HomeModel> houses;
  final bool isEnglish;

  const FeaturedHousesCarousel({
    Key? key,
    required this.houses,
    this.isEnglish = true,
  }) : super(key: key);

  @override
  State<FeaturedHousesCarousel> createState() => _FeaturedHousesCarouselState();
}

class _FeaturedHousesCarouselState extends State<FeaturedHousesCarousel> {
  int _currentIndex = 0;

  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    if (widget.houses.isEmpty) {
      return const Center(child: Text('No featured houses'));
    }

    return Column(
      children: [
        /// ----- CAROUSEL -----
        CarouselSlider.builder(
          itemCount: widget.houses.length,
          itemBuilder: (context, index, realIndex) {
            final house = widget.houses[index];
            return HouseCard(house: house, isEnglish: widget.isEnglish);
          },
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 5),
            enlargeCenterPage: true,
            viewportFraction: 0.95,
            height: 275.h,
            scrollDirection: Axis.horizontal,

            /// Track active dot
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),

        SizedBox(height: 12.h),

        /// ----- DOT INDICATORS -----
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.houses.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _currentIndex == index ? 12.0 : 8.0,
              height: _currentIndex == index ? 12.0 : 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Theme.of(context).colorScheme.error
                    : Colors.grey.withOpacity(0.4),
              ),
            );
          }),
        ),
      ],
    );
  }
}
