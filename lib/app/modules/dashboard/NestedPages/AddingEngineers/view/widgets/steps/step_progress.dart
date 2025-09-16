import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingEngineers/controller/adding_engineer_controller.dart';

class StepProgress extends StatelessWidget {
  final AddingEngineerController controller;
  const StepProgress({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => LinearProgressIndicator(
          value: (controller.currentStep.value + 1) / 3,
          backgroundColor: Colors.white.withOpacity(0.2),
          valueColor: AlwaysStoppedAnimation(AppColors.secondary),
          minHeight: 6.h,
        ));
  }
}
