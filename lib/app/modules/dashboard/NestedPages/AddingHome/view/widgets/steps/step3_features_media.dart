import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/controller/HomemanagerController.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/view/widgets/input_field.dart';
import 'package:my_house_app/generated/locales.g.dart';

class Step3FeaturesMedia extends StatelessWidget {
  final PropertyManagerController controller;
  const Step3FeaturesMedia({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ✅ Features Section
          InputField(LocaleKeys.first_feature.tr, "e.g., Sea View",
              controller.feature1Controller),
          SizedBox(height: 16.sp),
          InputField(LocaleKeys.second_feature.tr, "e.g., Swimming Pool",
              controller.feature2Controller),
          SizedBox(height: 16.sp),
          InputField(LocaleKeys.third_feature.tr, "e.g., Garden",
              controller.feature3Controller),

          SizedBox(height: 24.h),

          /// ✅ Timeline Section Title
          Text(
            LocaleKeys.timeline_title_title.tr, // e.g., "Timeline Settings"
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.fontcolor,
            ),
          ),
          SizedBox(height: 8.h),

          /// ✅ Timeline Checkbox
          Row(
            children: [
              Checkbox(
                value: controller.showOnTimeline,
                onChanged: (value) =>
                    controller.setShowOnTimeline(value ?? false),
                activeColor: AppColors.secondary,
              ),
              Expanded(
                child: Text(
                  LocaleKeys.timeline_title_label.tr,
                  style: TextStyle(color: AppColors.fontcolor),
                ),
              ),
            ],
          ),

          SizedBox(height: 24.h),

          /// ✅ Media Upload Section Title
          Text(
            LocaleKeys.Media_title.tr, // e.g., "Media Uploads"
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.fontcolor,
            ),
          ),
          SizedBox(height: 15.h),

          /// ✅ Image Upload
          Row(
            children: [
              const Icon(Icons.image, color: Colors.black),
              SizedBox(width: 8.w),
              ElevatedButton(
                onPressed: controller.pickImages,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                ),
                child: Text(LocaleKeys.images_button.tr),
              ),
              SizedBox(width: 12.w),
              Text("${controller.selectedImages.length} selected",
                  style: TextStyle(color: AppColors.fontcolor)),
            ],
          ),
          SizedBox(height: 16.h),

          /// ✅ Video Upload
          Row(
            children: [
              const Icon(Icons.video_collection, color: Colors.black),
              SizedBox(width: 8.w),
              ElevatedButton(
                onPressed: controller.pickVideo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.secondary,
                ),
                child: Text(LocaleKeys.videos_button.tr),
              ),
              SizedBox(width: 12.w),
              Text(
                controller.selectedVideo != null ? "Video Selected" : "No Video",
                style: TextStyle(color: AppColors.fontcolor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
