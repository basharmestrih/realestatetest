import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/AddingHome/view/widgets/input_field.dart';
import 'package:my_house_app/app/modules/dashboard/NestedPages/OthersDeletingTool/controller/OthersDeletingToolController.dart';
import 'package:my_house_app/app/modules/dashboard/views/widgets/Appbar.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';
import 'package:my_house_app/generated/locales.g.dart';

class OthersDeletingtool extends StatelessWidget {
  const OthersDeletingtool({super.key});

  @override
  Widget build(BuildContext context) {
    final OthersDeletingToolController controller = Get.find();
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
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
                    color: colorScheme.error,
                  ),
            ),
            _buildCardSection(
              context,
              children: [
                InputField(
                  "ID",
                  "e.g: 12",
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
            onPressed: controller.deleteOthers,
            buttonHeight: 50.h,
            buttonStyle: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              minimumSize: Size(double.infinity, 50.h),
            ),
            child: controller.isLoading.value
                ? SizedBox(
                    height: 22.sp,
                    width: 22.sp,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        colorScheme.onPrimaryContainer,
                      ),
                    ),
                  )
                : Text(
                    LocaleKeys.delete_button.tr,
                    style: TextStyle(
                      color:Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildCardSection(BuildContext context,
      {required List<Widget> children}) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: EdgeInsets.all(16.r),
      margin: EdgeInsets.only(bottom: 24.h),
      decoration: BoxDecoration(
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
