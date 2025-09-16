import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingEngineers/controller/adding_engineer_controller.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/view/widgets/input_field.dart';
import 'package:my_house_app/generated/locales.g.dart';
import 'package:get/get.dart';

class StepOne extends StatelessWidget {
  final AddingEngineerController controller;
  const StepOne({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return _buildCardSection(LocaleKeys.basic_title.tr, [
      InputField(LocaleKeys.engineer_name_label.tr, LocaleKeys.engineer_name_hint.tr, controller.nameController),
      InputField(LocaleKeys.engineer_specialization_label.tr, LocaleKeys.engineer_specialization_hint.tr, controller.specializationController),
      InputField(LocaleKeys.university_label.tr, LocaleKeys.university_hint.tr, controller.universityController),
      InputField(LocaleKeys.country_label.tr, LocaleKeys.country_hint.tr, controller.countryController),
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
