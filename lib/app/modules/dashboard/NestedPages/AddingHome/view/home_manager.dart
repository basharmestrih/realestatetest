import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/controller/HomemanagerController.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/view/widgets/Appbar.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/view/widgets/steps/step1_basic_info.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/view/widgets/steps/step2_details.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/view/widgets/steps/step3_features_media.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';
import 'package:my_house_app/generated/locales.g.dart';

class PropertyManager extends StatelessWidget {
  const PropertyManager({super.key});

  @override
  Widget build(BuildContext context) {
    final PropertyManagerController controller =
        Get.put(PropertyManagerController());

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: CustomAppBar(),
      body: GetBuilder<PropertyManagerController>(
        builder: (_) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          
            /// ✅ Step Indicator
            Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                children: [
                    Row(
              children: [
              Text(
                            LocaleKeys.add_house_card.tr,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          ],
                        ),
                        SizedBox(height: 24.h,),
                  LinearProgressIndicator(
                    value: (controller.currentStep + 1) / 3,
                    backgroundColor: Colors.grey.shade300,
                    color: AppColors.secondary,
                    minHeight: 6,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ],
              ),
            ),

            /// ✅ PageView for Steps
            Expanded(
              child: PageView(
                controller: controller.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Step1BasicInfo(controller: controller),
                  Step2Details(controller: controller),
                  Step3FeaturesMedia(controller: controller),
                ],
              ),
            ),

            /// ✅ Navigation Buttons
Padding(
  padding: EdgeInsets.all(16.r),
  child: Row(
    children: [
      /// ⬅️ Back Button
      if (controller.currentStep > 0)
        Expanded(
          child: ResponsiveButton(
            onPressed: controller.previousStep,
            clickable: true,
            buttonStyle: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              LocaleKeys.back_button.tr,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      if (controller.currentStep > 0) SizedBox(width: 12.w),

      /// ➡️ Next / Add Button
      Expanded(
        child: Obx(() {
          return ResponsiveButton(
            onPressed: controller.currentStep == 2
                ? controller.submitProperty
                : controller.nextStep,
            clickable: !controller.isLoading.value,
            buttonStyle: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: controller.isLoading.value &&
                    controller.currentStep == 2
                ? SizedBox(
                    height: 22,
                    width: 22,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    controller.currentStep == 2
                        ? LocaleKeys.addProperty.tr
                        : LocaleKeys.next_button.tr,
                    style: TextStyle(color: AppColors.fontcolor),
                  ),
          );
        }),
      ),
    ],
  ),
),

          ],
        ),
      ),
    );
  }
}
