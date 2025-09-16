import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/OthersmanagerController.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';
import 'package:my_house_app/generated/locales.g.dart';

class NavButtons extends StatelessWidget {
  final OthersManagerController controller;
  const NavButtons({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLastStep = controller.currentStep.value == 2;
      return Row(
        children: [
          if (controller.currentStep.value > 0)
            Expanded(
              child: ResponsiveButton(
                clickable: true,
                onPressed: controller.previousStep,
                buttonStyle: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: Text(LocaleKeys.back_button.tr,style: TextStyle(color: Colors.white),),
              ),
            ),
          SizedBox(width: 8.w),
          Expanded(
            child: ResponsiveButton(
              clickable: !controller.isLoading.value,
              onPressed: isLastStep ? controller.submitOthers : controller.nextStep,
              child: controller.isLoading.value && isLastStep
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text(isLastStep ? LocaleKeys.others_submit_property.tr : LocaleKeys.next_button.tr),
            ),
          ),
        ],
      );
    });
  }
}
