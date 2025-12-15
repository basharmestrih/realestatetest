import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_house_app/app/modules/home/views/widgets/advertise_card.dart';
import 'package:my_house_app/app/modules/home/views/widgets/consultant_card.dart';
import 'package:my_house_app/app/modules/home/views/widgets/home_property_card.dart';
import 'package:my_house_app/app/modules/home/views/widgets/section_title.dart';
import 'package:my_house_app/app/modules/home/views/widgets/service_card.dart';
import 'package:my_house_app/app/modules/others/controllers/others_controller.dart';
import 'package:my_house_app/app/modules/property/controllers/propertycontroller.dart';
import 'package:my_house_app/app/modules/property/view/widgets/propertycard.dart';
import 'package:my_house_app/generated/locales.g.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final propertyController = Get.find<PropertyController>();
  final homeController = Get.find<HomeController>();
  final othersController = Get.find<OthersController>();

  Future<void> _onRefresh() async {
    
    // Call your API methods again
    await Future.wait([
      propertyController.fetchHouses(), // example method
      homeController.fetchFeaturedHouse(),       // example method
      othersController.fetchOthersData(),// example method
    ] as Iterable<Future>);
  }

  @override
  Widget build(BuildContext context) {
      final theme = Theme.of(context);

    return RefreshIndicator(
      onRefresh: _onRefresh,
      color:Theme.of(context).colorScheme.error, 
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(), 
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SectionTitle(title: LocaleKeys.ad_title.tr),
                SizedBox(width: 8.w),
                Obx(() {
                  final count = homeController.featuredHouses?.length ?? 0;
                  return Container(
                    width: 20.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.error,
                      shape: BoxShape.circle,

                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '$count',
                      style: TextStyle(
                        color:theme.colorScheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    ),
                  );
                }),
              ],
            ),
             SizedBox(height: 16.h),
            AdvertiseSection(),
            SizedBox(height: 24.h),
            SectionTitle(title: LocaleKeys.ourServices.tr),
            SizedBox(height: 16.h),

            // Services Row 1
            SizedBox(
              height: 180.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ServiceCard(
                      title: LocaleKeys.propertiesForSale.tr,
                      icon: Icons.sell,
                      imgUrl: 'assets/images/sale2-photo.jpg',
                      index: 1,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ServiceCard(
                      title: LocaleKeys.propertiesForRent.tr,
                      icon: Icons.home_work_outlined,
                      imgUrl: 'assets/images/rent2-photo.jpg',
                      index: 1,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),

            // Services Row 2
            SizedBox(
              height: 180.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ServiceCard(
                      title: LocaleKeys.landsForSale.tr,
                      icon: Icons.sell,
                      imgUrl: 'assets/backgrounds/landsimage.jpg',
                      index: 2,
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ServiceCard(
                      title: LocaleKeys.factoriesForSale.tr,
                      icon: Icons.home_work_outlined,
                      imgUrl: 'assets/backgrounds/restaurants.jpg',
                      index: 2,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 32.h),
            ConsultantCard(),
            SizedBox(height: 24.h),
            SectionTitle(title: LocaleKeys.latestAddedProperties.tr),
            SizedBox(height: 16.h),

            Obx(() {
              if (propertyController.isLoading.value) {
                return Center(
                  child: SizedBox(
                    width: 100.w,
                    height: 125.h,
                    child: const SpinKitFadingCircle(
                      color: Colors.black,
                      size: 100.0,
                    ),
                  ),
                );
              }

              if (propertyController.houseList.isEmpty) {
                return Center(child: Text(LocaleKeys.noHousesFound.tr));
              }

              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: propertyController.houseList.length.clamp(0, 4),
                itemBuilder: (_, index) {
                  final home = propertyController.houseList[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: HomePropertyCard(
                      imageUrls: home.imgUrls,
                      videoUrl: home.videoUrl,
                      location: home.location,
                      address: home.address,
                      name: home.title,
                      roomsNumber: home.roomsNumber,
                      bathsNumber: home.bathsNumber,
                      floorsNumber: home.floorsNumber,
                      groundDistance: home.groundDistance,
                      buildingAge: home.buildingAge,
                      mainFeatures: home.mainFeatures,
                      description: home.description,
                      price: '\$${home.price}',
                      isSell: home.isSell,
                      isRent: home.isRent,
                      isFurnitured: home.isFurnitured,
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
