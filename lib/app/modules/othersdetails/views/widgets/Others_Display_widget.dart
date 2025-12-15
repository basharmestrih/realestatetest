import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../propertydetails/views/widgets/Property_Video_widget.dart';
import 'Others_Video_widget.dart';

class OthersDisplayWidget extends StatefulWidget {
  const OthersDisplayWidget({super.key, required this.imageUrls});

  final List<String> imageUrls;

  @override
  State<OthersDisplayWidget> createState() => _OthersDisplayWidgetState();
}

class _OthersDisplayWidgetState extends State<OthersDisplayWidget> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.imageUrls.length,
          itemBuilder: (context, index, realIndex) {
            final imageUrl = widget.imageUrls[index];
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                child: Stack(
                    children: [
                      // Background Image
                      Positioned.fill(
                        child: Image.network(
                          imageUrl,
                          width: double.infinity,
                          height: 400.h,
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.center,
                        ),
                      ),
                
                      // ✅ Top-right video button
                      Positioned(
                        top: 12.h,
                        right: 12.w,
                        child: const OthersVideoWidget(),
                      ),
                    ],
                  ),
              ),
            );
          },
          options: CarouselOptions(
            height: 450.h,
            viewportFraction: 0.98,
            enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.imageUrls.length, (index) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _currentIndex == index ? 12.0 : 8.0,
              height: _currentIndex == index ? 12.0 : 8.0,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == index
                    ? Colors.black
                    : Colors.grey.withOpacity(0.4),
              ),
            );
          }),
        ),
      ],
    );
  }
}
