import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PropertySituation extends StatelessWidget {
  final bool isSell;
  final bool isRent;
  final bool isFurnitured;

  const PropertySituation({
    super.key,
    required this.isSell,
    required this.isRent,
    required this.isFurnitured,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            isSell
                ? 'for_sale_category'.tr
                : isRent
                    ? 'for_rent_category'.tr
                    : 'Null',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.black,
                ),
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
          children: [
            Icon(
              isFurnitured ? Icons.check_outlined : Icons.cancel,
              color: isFurnitured ? Colors.black : Colors.red,
              size: 22.sp,
            ),
            SizedBox(width: 4), // small spacing between icon and text
            Text(
              isFurnitured ? 'furnitured_category'.tr : 'not_furnitured_category'.tr,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.black,
                  ),
            ),
          ],
        )

        ),
      ],
    );
  }
}
