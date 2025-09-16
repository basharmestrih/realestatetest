import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';

class SearchBarWithButton extends StatelessWidget {
  final VoidCallback onSearch;
  final TextEditingController controller;

  const SearchBarWithButton({
    super.key,
    required this.onSearch,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        color: AppColors.lightGrey,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Centered text field
          Expanded(
            child: TextField(
              controller: controller,
                style: TextStyle(
                color: AppColors.fontcolor, // Set input text color
                fontSize: 17.sp,
              ),
              decoration: InputDecoration(
                fillColor: AppColors.lightGrey,
                hintText: 'search_label_hint'.tr,
                hintStyle: TextStyle(
                fontSize: 14.sp, // Smaller font size
                color:AppColors.grey, // Custom hint color
              ),
                prefixIcon: const Icon(Icons.search),
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10.h),
              ),
            ),
          ),

          SizedBox(width: 8.w),

          // Button on the right
          Padding(
            padding:  EdgeInsets.all(4.h),
            child: ResponsiveButton(
              //buttonHeight: 40.h,
              onPressed: onSearch,
              clickable: true,
              buttonStyle: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  ),
                ),
              ),
              buttonWidth: 80.w,
              child: Text('button_search'.tr, style: Theme.of(context).textTheme.labelSmall,),
            ),
          ),
        ],
      ),
    );
  }
}
