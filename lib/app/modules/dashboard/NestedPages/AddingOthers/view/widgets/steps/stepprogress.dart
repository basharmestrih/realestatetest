import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/OthersmanagerController.dart';
import 'package:my_house_app/app/core/theme/colors.dart';

class StepProgress extends StatelessWidget {
  final OthersManagerController controller;
  const StepProgress({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      const totalSteps = 4;
      return LinearProgressIndicator(
        value: (controller.currentStep.value + 1) / totalSteps,
        backgroundColor: Colors.white.withOpacity(0.2),
        valueColor: AlwaysStoppedAnimation(AppColors.secondary),
        minHeight: 6.h,
      );
    });
  }
}
