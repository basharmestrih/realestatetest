import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import '../../controllers/mainbar_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavBar extends StatelessWidget {
  final MainbarController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
       
        height: 65.h,

        // Reduced margin for wider bar
       margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 8.h,bottom:16.h),

        decoration: BoxDecoration(
           color: Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
           //border: Border.all(color: Colors.black, width: 3),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            final tabIcons = [
              Icons.home,
              Icons.store,
              Icons.landscape,
              Icons.person,
            ];
            final tabLabels = [
              'bar_label_1'.tr,
              'bar_label_2'.tr,
              'bar_label_3'.tr,
              'bar_label_4'.tr,
              
            ];
            final isSelected = controller.selectedIndex.value == index;
            final selectedColors = [
              AppColors.secondary,
              AppColors.secondary,
              AppColors.secondary,
              AppColors.secondary,
            ];
            return GestureDetector(
              onTap: () => controller.changeBody(index),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
                decoration: isSelected
                    ? BoxDecoration(
                        color: selectedColors[index],
                        borderRadius: BorderRadius.circular(16),
                      )
                    : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      tabIcons[index],
                      size: 25.sp,
                      color: isSelected
                          ?  Colors.black
                          : Colors.grey[400]
                    ),
                    SizedBox(width: 6.w),
                    // Only show text if the item is selected
                    if (isSelected)
                      Text(
                        tabLabels[index],
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall
                            ?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                            ),
                        textAlign: TextAlign.center,
                      ),
                  ],
                ),
              ),
            );
          }),
        ),
      );
    });
  }
}
