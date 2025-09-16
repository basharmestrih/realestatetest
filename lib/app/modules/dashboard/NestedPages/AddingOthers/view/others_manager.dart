
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingOthers/controller/OthersmanagerController.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingOthers/view/widgets/Appbar.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingOthers/view/widgets/steps/navbuttons.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingOthers/view/widgets/steps/stepcontent.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingOthers/view/widgets/steps/stepprogress.dart';
import 'package:my_house_app/generated/locales.g.dart';

class OthersManager extends StatelessWidget {
  const OthersManager({super.key});

  @override
  Widget build(BuildContext context) {
    final OthersManagerController controller = Get.put(OthersManagerController());

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
              Text(
                            LocaleKeys.add_others_card.tr,
                            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                                  color: AppColors.fontcolor,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          ],
                        ),
             SizedBox(height: 24.h),
            StepProgress(controller: controller),
            SizedBox(height: 16.h),
            Expanded(child: SingleChildScrollView(child: StepContent(controller: controller))),
            SizedBox(height: 16.h),
            NavButtons(controller: controller),
          ],
        ),
      ),
    );
  }
}
