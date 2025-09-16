import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/routes/app_pages.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomePropertyCard extends StatelessWidget {
  
  final List<String> imageUrls;
  final String? videoUrl;
  final String location;
  final String address;
  final String name;
  final String price;
  final String description;
  final bool isSell;
  final bool isRent;
  final bool isFurnitured;
  final int? roomsNumber;
  final int? bathsNumber;
  final int? floorsNumber;
  final int? groundDistance;
  final int? buildingAge;
  final List<String>? mainFeatures;


  const HomePropertyCard({
    required this.imageUrls,
    this.videoUrl,
    required this.location,
    required this.address,
    required this.name,
    required this.price,
    required this.description,
    required this.isSell,
    required this.isRent,
    required this.isFurnitured,
    this.roomsNumber,
    this.bathsNumber,
    this.floorsNumber,
    this.groundDistance,
    this.buildingAge,
    this.mainFeatures,
  });
  

  @override
  Widget build(BuildContext context) {
      final bool fontDirection = (Get.locale?.languageCode == 'en');



    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
      child: Padding(
        padding: EdgeInsets.all(0), // Image has no inside padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageCarouselWithDots(imageUrls: imageUrls),


            // Content Panel
            Padding(
              padding: EdgeInsets.all(18.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title & Subtitle
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    location,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color:AppColors.grey,
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),

                  SizedBox(height: 12.h),

                  // Description
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.grey[850],
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 16.h),
           

                 // Key Info Block
                _infoRow(fontDirection,label: 'roomsnumber'.tr, valueWidget: Text(roomsNumber.toString(), style: Theme.of(context).textTheme.bodyMedium), context: context),
                _infoRow(fontDirection,label:'distance'.tr, valueWidget: Text(groundDistance.toString(), style: Theme.of(context).textTheme.bodyMedium), context: context),
                _infoRow(
                  fontDirection,
                  label:  'features'.tr,
                  valueWidget: Text(
                    mainFeatures != null && mainFeatures!.isNotEmpty
                        ? mainFeatures!.take(2).join(' - ')
                        : 'N/A',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  context: context,
                ),
                _infoRow(
                  fontDirection,
                  label: 'furniture'.tr,
                  valueWidget: isFurnitured
                      ? Icon(Icons.check_circle, color: Colors.green, size: 20.sp)
                      : Icon(Icons.cancel, color: Colors.red, size: 20.sp),
                  context: context,
                ),



                  SizedBox(height: 16.h),

                  ResponsiveButton(
                    buttonHeight: 45.h,
                    buttonWidth: double.infinity,
                    clickable: true,
                    onPressed: () {
                                         Get.toNamed(
                      Routes.PROPERTYDETAILS,
                      arguments: {
                        'imgUrls': imageUrls,
                        'videoUrl': videoUrl,
                        'location': location,
                        'address': address,
                        'title': name,
                        'price': price,
                        'description': description,
                        'roomsNumber': roomsNumber,
                        'bathsNumber': bathsNumber,
                        'floorsNumber': floorsNumber,
                        'groundDistance': groundDistance,
                        'buildingAge': buildingAge,
                        'mainFeatures': mainFeatures,
                        'isSell': isSell,
                        'isRent': isRent,
                        'isFurnitured': isFurnitured,
                      },
                    );
                      
                    },
                    child: Text(
                      'contact_seller_button'.tr,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        
                        letterSpacing: 0.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

Widget _infoRow(bool fontDirection, {required String label, required Widget valueWidget, required BuildContext context}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 2.h),
    child: Directionality(
      textDirection: fontDirection == true ? TextDirection.ltr : TextDirection.rtl,
      child: Row(
        children: [
          Text(
            "$label ",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Expanded(
            child: Center(child: valueWidget),
          ),
        ],
      ),
    ),
  );
}

}



// Image Carousel Widget
class ImageCarouselWithDots extends StatefulWidget {
  final List<String> imageUrls;

  const ImageCarouselWithDots({Key? key, required this.imageUrls}) : super(key: key);

  @override
  _ImageCarouselWithDotsState createState() => _ImageCarouselWithDotsState();
}

class _ImageCarouselWithDotsState extends State<ImageCarouselWithDots> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: 220.h,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              autoPlay: widget.imageUrls.length > 1,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: widget.imageUrls.map((imageUrl) {
              return Image.network(
                imageUrl,
                width: double.infinity,
                height: 180.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 180.h,
                  width: double.infinity,
                  color: Colors.grey[200],
                  child: Icon(Icons.chair_alt_outlined, size: 48, color: Colors.grey),
                ),
              );
            }).toList(),
          ),
          Positioned(
            bottom: 8.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.imageUrls.asMap().entries.map((entry) {
                bool isActive = entry.key == _currentIndex;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 6.w),
                  width: isActive ? 18.w : 10.w,
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: isActive ? Colors.white.withOpacity(0.9) : Colors.white54,
                    borderRadius: BorderRadius.circular(5.h),
                    boxShadow: isActive
                        ? [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ]
                        : null,
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}