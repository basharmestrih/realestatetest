import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';
import '../../../controller/adding_engineer_controller.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/generated/locales.g.dart';

class NavButtons extends StatelessWidget {
  final AddingEngineerController controller;
  const NavButtons({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLastStep = controller.currentStep.value == 2;

      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back button
          if (controller.currentStep.value > 0)
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: ResponsiveButton(
                  onPressed: controller.previousStep,
                  clickable: true,
                  buttonWidth: double.infinity,
                  buttonHeight: 50.h,
                  buttonStyle: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r)),
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                  ),
                  child: Text(
                    LocaleKeys.back_button.tr,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),

          // Next / Submit button
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: ResponsiveButton(
                onPressed: isLastStep
                    ? (controller.isLoading.value ? () {} : controller.submitProfile)
                    : controller.nextStep,
                clickable: !controller.isLoading.value,
                buttonWidth: double.infinity,
                buttonHeight: 50.h,
                buttonStyle: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r)),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                ),
                child: controller.isLoading.value && isLastStep
                    ? SizedBox(
                        width: 24.w,
                        height: 24.w,
                        child: const CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        isLastStep
                            ? LocaleKeys.submit_engineer_button.tr
                            : LocaleKeys.next_button.tr,
                        style: const TextStyle(color: Colors.black),
                      ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
