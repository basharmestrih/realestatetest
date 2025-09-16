import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  final propertycontroller = Get.find<PropertyController>();
   final homecontroller = Get.find<HomeController>();
      final otherscontroller = Get.find<OthersController>();

  

  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top advertising card
          
          AdvertiseCard(),
      
          SizedBox(height: 24.h),

          // Section title
          SectionTitle(title: LocaleKeys.ourServices.tr),


          SizedBox(height: 16.h),

          // Three service cards in a row
          SizedBox(
            height: 180.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Expanded(child: ServiceCard(title: LocaleKeys.propertiesForSale.tr, icon: Icons.sell, imgUrl: 'assets/images/sale2-photo.jpg',)),
                SizedBox(width: 12),
                Expanded(child: ServiceCard(title: LocaleKeys.propertiesForRent.tr, icon: Icons.home_work_outlined, imgUrl: 'assets/images/rent2-photo.jpg',)),
       
              ],
            ),
          ),
          SizedBox(height: 10.h,),
                    SizedBox(
            height: 180.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                Expanded(child: ServiceCard(title: LocaleKeys.landsForSale.tr, icon: Icons.sell, imgUrl: 'assets/backgrounds/landsimage.jpg',)),
                SizedBox(width: 12),
                Expanded(child: ServiceCard(title: LocaleKeys.factoriesForSale.tr, icon: Icons.home_work_outlined, imgUrl: 'assets/backgrounds/restaurants.jpg',)),
       
              ],
            ),
          ),
       
            SizedBox(height: 32.h),

          // New full-width image card with button
          ConsultantCard(),
             SizedBox(height: 24.h),
              // Section title
          SectionTitle(title: LocaleKeys.latestAddedProperties.tr),
          SizedBox(height: 16.h),

           Obx(() {
             if (propertycontroller.isLoading.value) {
               return Center(
                 child: SizedBox(
                   width: 100.w,
                   height: 125.h,
                   child: CircularProgressIndicator(
                     valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondary),
                   ),
                 ),
               );
             }
           
             if (propertycontroller.houseList.isEmpty) {
               return Center(child: Text(LocaleKeys.noHousesFound.tr));
             }
           
             return ListView.builder(
               shrinkWrap: true,
               physics: NeverScrollableScrollPhysics(), 
              itemCount: propertycontroller.houseList.length.clamp(0, 4),

               itemBuilder: (_, index) {
                 final home = propertycontroller.houseList[index];
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
    );
  }
}
