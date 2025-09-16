import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingEngineers/controller/adding_engineer_controller.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingEngineers/view/widgets/steps/nav_buttons.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingEngineers/view/widgets/steps/step_content.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingEngineers/view/widgets/steps/step_progress.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/view/widgets/Appbar.dart';
import 'package:my_house_app/generated/locales.g.dart';

class AddingEngineer extends StatelessWidget {
  final AddingEngineerController controller = Get.put(AddingEngineerController());

  AddingEngineer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.adding_engineer_title.tr,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: AppColors.fontcolor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            SizedBox(height: 24.h),

            // Step progress is reactive
            StepProgress(controller: controller),
            SizedBox(height: 16.h),

            // Step content is reactive
            Expanded(
              child: SingleChildScrollView(
                child: StepContent(controller: controller),
              ),
            ),
            SizedBox(height: 16.h),

            // Navigation buttons reactive
            NavButtons(controller: controller),
          ],
        ),
      ),
    );
  }
}
