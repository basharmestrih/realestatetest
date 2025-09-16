import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingEngineers/controller/adding_engineer_controller.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/view/widgets/input_field.dart';
import 'package:my_house_app/generated/locales.g.dart';

class StepThree extends StatelessWidget {
  final AddingEngineerController controller;
  const StepThree({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return _buildCardSection(LocaleKeys.engineer_phone_label.tr, [
      InputField(LocaleKeys.engineer_phone_label.tr, LocaleKeys.engineer_phone_hint.tr, controller.phoneController),
      _buildFilePicker(),
    ]);
  }

  Widget _buildCardSection(String title, List<Widget> children) {
    return Container(
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 16.sp, fontWeight: FontWeight.bold, color: AppColors.fontcolor)),
          SizedBox(height: 16.h),
          ...children.expand((w) => [w, SizedBox(height: 16.h)]).toList()..removeLast(),
        ],
      ),
    );
  }

  Widget _buildFilePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(LocaleKeys.Media_title.tr,
            style: TextStyle(color: AppColors.fontcolor, fontSize: 15.sp)),
        SizedBox(height: 8.h),
        Obx(() {
          return GestureDetector(
            onTap: controller.pickFile,
            child: Container(
              width: double.infinity,
              height: 150.h,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Colors.white24),
              ),
              child: controller.selectedFile.value != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.file(
                        controller.selectedFile.value!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Center(
                      child: Text(LocaleKeys.images_button.tr,
                          style: TextStyle(color: AppColors.lightGrey)),
                    ),
            ),
          );
        }),
      ],
    );
  }
}
