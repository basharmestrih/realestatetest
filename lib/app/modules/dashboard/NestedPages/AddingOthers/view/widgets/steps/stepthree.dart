import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/OthersmanagerController.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/generated/locales.g.dart';

class StepThree extends StatelessWidget {
  final OthersManagerController controller;
  const StepThree({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return _buildCardSection(children: [
      // Media Section
      Text(LocaleKeys.Media_title.tr, style: Theme.of(context).textTheme.titleLarge?.copyWith(
          color: AppColors.fontcolor, fontWeight: FontWeight.bold)),
      SizedBox(height: 12.h),
      Row(
        children: [
          Icon(Icons.image, color: AppColors.fontcolor),
          SizedBox(width: 8.w),
          ElevatedButton(
            onPressed: controller.pickImages,
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondary),
            child: Text(LocaleKeys.images_button.tr),
          ),
          SizedBox(width: 12.w),
          Text("${controller.selectedImages.length} selected", style: TextStyle(color: AppColors.fontcolor)),
        ],
      ),
      SizedBox(height: 16.h),
      Row(
        children: [
          Icon(Icons.video_collection, color: AppColors.fontcolor),
          SizedBox(width: 8.w),
          ElevatedButton(
            onPressed: controller.pickVideo,
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondary),
            child: Text(LocaleKeys.videos_button.tr),
          ),
          SizedBox(width: 12.w),
          Text(controller.selectedVideo != null ? "Video selected" : "No video", style: TextStyle(color: AppColors.fontcolor)),
        ],
      ),
      SizedBox(height: 12.h),
      // Timeline & Category Section
      Row(
        children: [
         Checkbox(
  value: controller.showOnTimeline.value, // ✅ use .value
  onChanged: (value) => controller.setShowOnTimeline(value ?? false),
  activeColor: AppColors.secondary,
),

          Text(LocaleKeys.timeline_title_label.tr, style: TextStyle(color: AppColors.fontcolor)),
        ],
      ),
      SizedBox(height: 12.h),
      Text(LocaleKeys.category_hint.tr, style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.fontcolor, fontWeight: FontWeight.bold)),
      Row(
        children: [
          Checkbox(
            value: controller.selectedCategory == 'Shop',
            onChanged: (v) => controller.setSelectedCategory(v == true ? 'Shop' : null),
          ),
          Text(LocaleKeys.shop_option.tr, style: TextStyle(color: AppColors.fontcolor)),
        ],
      ),
      Row(
        children: [
          Checkbox(
            value: controller.selectedCategory == 'Land',
            onChanged: (v) => controller.setSelectedCategory(v == true ? 'Land' : null),
          ),
          Text(LocaleKeys.land_option.tr, style: TextStyle(color: AppColors.fontcolor)),
        ],
      ),
    ]);
  }

  Widget _buildCardSection({required List<Widget> children}) {
    return Container(
      padding: EdgeInsets.all(12.r),
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children.expand((w) => [w, SizedBox(height: 8.h)]).toList()..removeLast(),
      ),
    );
  }
}
