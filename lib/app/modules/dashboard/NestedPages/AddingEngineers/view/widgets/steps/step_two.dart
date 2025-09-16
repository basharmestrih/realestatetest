import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingEngineers/controller/adding_engineer_controller.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/view/widgets/input_field.dart';
import 'package:my_house_app/generated/locales.g.dart';
import 'package:get/get.dart';

class StepTwo extends StatelessWidget {
  final AddingEngineerController controller;
  const StepTwo({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return _buildCardSection(LocaleKeys.addi_title.tr, [
      InputField(LocaleKeys.city_label.tr, LocaleKeys.city_hint.tr, controller.cityController),
      InputField(LocaleKeys.experience_label.tr, LocaleKeys.experience_hint.tr, controller.experienceController),
      InputField(LocaleKeys.languages_label.tr, LocaleKeys.languages_hint.tr, controller.languagesController),
      InputField(LocaleKeys.years_experience_label.tr, LocaleKeys.years_experience_hint.tr, controller.yearsExperienceController),
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
}
