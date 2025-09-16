import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingOthers/controller/OthersmanagerController.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingOthers/view/widgets/steps/stepone.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingOthers/view/widgets/steps/stepthree.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingOthers/view/widgets/steps/steptwo.dart';


class StepContent extends StatelessWidget {
  final OthersManagerController controller;
  const StepContent({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.currentStep.value) {
        case 0: return StepOne(controller: controller);
        case 1: return StepTwo(controller: controller);
        case 2: return StepThree(controller: controller);
        default: return SizedBox();
      }
    });
  }
}
