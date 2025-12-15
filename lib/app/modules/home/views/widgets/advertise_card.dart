import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/modules/askforad/views/page.dart';
import 'package:my_house_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_house_app/app/modules/home/views/widgets/featured_houses_carousel.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';
import 'package:my_house_app/app/routes/app_pages.dart';
import 'package:my_house_app/generated/locales.g.dart';

class AdvertiseSection extends StatelessWidget {
  const AdvertiseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    final isEnglish = Get.locale?.languageCode == 'en';

    return Column(
      children: [
        Obx(() {
          // 1️⃣ Loading state
          if (homeController.isLoading.value) {
            return SizedBox(
              height: 170.h,
              child: const Center(
                child: SpinKitFadingCircle(
                  color: Colors.black,
                  size: 80.0,
                ),
              ),
            );
          }

          final houses = homeController.featuredHouses; 

          if (houses == null) {
            return GestureDetector(
              onTap: () => Get.to(() => const AskForAdPage()),
              child: Container(
                width: double.infinity,
                height: 160.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  color: AppColors.secondary,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ad_label'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(color: AppColors.black),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        'ad_label_ext'.tr,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.numbersfontcolor,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          return FeaturedHousesCarousel(isEnglish: true, houses: houses);

       
        }),
      ],
    );
  }
}
