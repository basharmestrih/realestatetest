import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/OthersmanagerController.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/view/widgets/input_field.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/generated/locales.g.dart';

class StepOne extends StatelessWidget {
  final OthersManagerController controller;
  const StepOne({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return _buildCardSection(children: [
      InputField(LocaleKeys.title_label.tr, LocaleKeys.title_hint.tr, controller.titleController),
      InputField(LocaleKeys.description_label.tr, LocaleKeys.description_hint.tr, controller.descriptionController,isMultiline: true),
      InputField(LocaleKeys.price_label.tr, LocaleKeys.price_hint.tr, controller.priceController),
      InputField(LocaleKeys.area_label.tr, LocaleKeys.area_hint.tr, controller.areadistanceController),
      InputField(LocaleKeys.address_label.tr, LocaleKeys.address_hint.tr, controller.addressController),
      InputField(LocaleKeys.location.tr, LocaleKeys.location_hint.tr, controller.locationController),
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
