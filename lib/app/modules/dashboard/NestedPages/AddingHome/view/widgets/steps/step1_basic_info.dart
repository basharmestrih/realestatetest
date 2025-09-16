import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/controller/HomemanagerController.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/view/widgets/input_field.dart';
import 'package:my_house_app/generated/locales.g.dart';

class Step1BasicInfo extends StatelessWidget {
  final PropertyManagerController controller;
  const Step1BasicInfo({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.r),
      child: Column(
        children: [
          InputField(LocaleKeys.title_label.tr, LocaleKeys.title_hint.tr,
              controller.titleController),
          SizedBox(height: 16.sp),
          InputField(LocaleKeys.description_label.tr,
              LocaleKeys.description_hint.tr, controller.descriptionController),
          SizedBox(height: 16.sp),
          InputField(LocaleKeys.price_label.tr, LocaleKeys.price_hint.tr,
              controller.priceController),
          SizedBox(height: 16.sp),
          InputField(LocaleKeys.address_label.tr, LocaleKeys.address_hint.tr,
              controller.addressController),
          SizedBox(height: 16.sp),
          InputField(LocaleKeys.location.tr, LocaleKeys.location_hint.tr,
              controller.locationController),
        ],
      ),
    );
  }
}
