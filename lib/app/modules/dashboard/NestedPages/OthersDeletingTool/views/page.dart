import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/view/widgets/input_field.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/OthersDeletingTool/controller/OthersDeletingToolController.dart';
import 'package:my_house_app/app/modules/dashboard/views/widgets/Appbar.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';
import 'package:my_house_app/generated/locales.g.dart';

class OthersDeletingtool extends StatelessWidget {
  const OthersDeletingtool({super.key});

  @override
  Widget build(BuildContext context) {
    final OthersDeletingToolController controller = Get.find();

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 48.h),
            Text(
              "others_deleting_tip".tr,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            _buildCardSection(
              context,
              children: [
                InputField(
                  "", // ✅ label
                  "e.g: 12", // ✅ hint
                  controller.idcontroller,
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.r),
        child: Obx(
          () => ResponsiveButton(
            clickable: !controller.isLoading.value,
            onPressed: ()async{controller.isLoading.value
                ? null
                : controller.deleteOthers;},
            buttonHeight: 50.h,
            buttonStyle: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              minimumSize: Size(double.infinity, 50.h),
            ),
            child: controller.isLoading.value
                ? SizedBox(
                    height: 22.sp,
                    width: 22.sp,
                    child: const CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    LocaleKeys.delete_button.tr,
                    style: TextStyle(
                      color: AppColors.fontcolor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardSection(BuildContext context,
      {required List<Widget> children}) {
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
        children: children
            .expand((widget) => [widget, SizedBox(height: 20.h)])
            .toList()
          ..removeLast(),
      ),
    );
  }
}
