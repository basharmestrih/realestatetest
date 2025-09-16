import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/data/models/home_model.dart';
import 'package:my_house_app/app/modules/mainscreen/controllers/mainbar_controller.dart';
import 'package:my_house_app/app/modules/home/controllers/home_controller.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';
import 'package:my_house_app/generated/locales.g.dart';

class AdvertiseCard extends StatelessWidget {
  const AdvertiseCard({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();



    return Obx(() {
      final house = homeController.featuredHouse.value;




      return GestureDetector(
        //onTap: () => Get.find<MainbarController>().changeBody(2),
        child: Container(
          width: double.infinity,
          height: 265.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            color: AppColors.secondary,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child:   Obx(() {
            if (homeController.isLoading.value || house==null) {
              return
               Center(
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
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontWeight: FontWeight.bold,color:AppColors.numbersfontcolor),
                      ),
                    ],
                  ),
                );
                }
          
           
               
            return
        Row(
                  children: [
                    // LEFT SIDE: Text details
                                        Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.horizontal(right: Radius.circular(16.r)),
                        child: house.imgUrls.isNotEmpty
                            ? Image.network(
                                house.imgUrls.first,
                                fit: BoxFit.cover,
                                height: double.infinity,
                              )
                            : Container(
                                color: Colors.grey[300],
                                child: Icon(Icons.home, size: 40, color: Colors.grey[600]),
                              ),
                      ),
                    ),
                 
                    // RIGHT SIDE: Image

                  Expanded(
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(16.r)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          house.title ?? '',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          house.location ?? '',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          house.address ?? '',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(height: 16.h),
                         if (house.mainFeatures != null && house.mainFeatures!.isNotEmpty) ...[
                    Wrap(
                      spacing: 8.w,
                      runSpacing: 10.h,
                      children: house.mainFeatures!
                          .take(3)
                          .map(
                            (feature) => Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                              decoration: BoxDecoration(
                                color: AppColors.secondary,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Text(
                                feature,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: AppColors.fontcolor),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    if (house.mainFeatures!.length > 3)
                      Padding(
                        padding: EdgeInsets.only(top: 6.h),
                      
                      ),
                  ],
                     
                  

                        // Add spacing between existing and new features list
                        SizedBox(height: 11.h),
                       

                        // Insert each main feature as a separate Text row
                                      // Main features limited to max 3 items (optional)
                                      // New "مشاهدة المزيد" with arrow
  Padding(
    padding: EdgeInsets.only(top: 10.h , right: 5.w),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'مشاهدة المزيد',
          style: TextStyle(
            color: AppColors.fontcolor,
            fontSize: 13.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 6.w),

        Icon(
          Icons.keyboard_double_arrow_left_outlined,
          color: AppColors.grey,
          size: 25.sp,
        ),

      
      ],
    ),
  ),

                                      
                  
                      ],
                    ),
                  ),
                ),


                  ],
                );
          
          
          }
        ),
      ),
      );
    });
  }
}
