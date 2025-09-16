import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/controller/HomemanagerController.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/view/widgets/input_field.dart';
import 'package:my_house_app/generated/locales.g.dart';

class Step2Details extends StatelessWidget {
  final PropertyManagerController controller;
  const Step2Details({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.r),
      child: Column(
        children: [
          InputField(LocaleKeys.roomsnumber.tr, "e.g., 2",
              controller.bedroomsController),
          SizedBox(height: 16.sp),
          InputField(LocaleKeys.bathrooms_label.tr, LocaleKeys.bathrooms_hint.tr,
              controller.bathroomsController),
          SizedBox(height: 16.sp),
          InputField(LocaleKeys.floors_number.tr, "e.g., 2",
              controller.floorsNumberController),
          SizedBox(height: 16.sp),
          InputField(LocaleKeys.building_age.tr, "e.g., 3",
              controller.buildingAgeController),
          SizedBox(height: 16.sp),
          InputField(LocaleKeys.ground_distance.tr, "e.g., 15",
              controller.groundDistanceController),
        ],
      ),
    );
  }
}
