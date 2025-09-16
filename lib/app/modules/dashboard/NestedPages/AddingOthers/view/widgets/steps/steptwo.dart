import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/OthersmanagerController.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/view/widgets/input_field.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/generated/locales.g.dart';

class StepTwo extends StatelessWidget {
  final OthersManagerController controller;
  const StepTwo({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return _buildCardSection(children: [
      InputField(LocaleKeys.floors_number.tr, 'e.g., 2', controller.floorsNumberController),
      InputField(LocaleKeys.meterical_dimension.tr, 'e.g., 2500 m', controller.arealengthController),
      InputField(LocaleKeys.meterical_width.tr, 'e.g., 2500 m', controller.areawidthController),
      InputField(LocaleKeys.first_feature.tr, 'e.g., Sea view', controller.feature1Controller),
      InputField(LocaleKeys.second_feature.tr, 'e.g., Swimming Pool', controller.feature2Controller),
      InputField(LocaleKeys.third_feature.tr, 'e.g., Garden', controller.feature3Controller),
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
