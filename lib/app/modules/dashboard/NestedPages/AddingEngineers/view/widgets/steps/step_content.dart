import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingEngineers/controller/adding_engineer_controller.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingEngineers/view/widgets/steps/step_one.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingEngineers/view/widgets/steps/step_three.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingEngineers/view/widgets/steps/step_two.dart';


class StepContent extends StatelessWidget {
  final AddingEngineerController controller;
  const StepContent({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.currentStep.value) {
        case 0:
          return StepOne(controller: controller);
        case 1:
          return StepTwo(controller: controller);
        case 2:
          return StepThree(controller: controller);
        default:
          return const SizedBox();
      }
    });
  }
}
