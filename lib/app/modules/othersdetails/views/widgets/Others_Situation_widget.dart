import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';

class OthersSituationWidget extends StatelessWidget {
  final bool isSell;
  final bool isRent;

  const OthersSituationWidget({
    super.key,
    required this.isSell,
    required this.isRent,

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
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.black,
                ),
          ),
        ),
        SizedBox(width: 10.w),
        
      ],
    );
  }
}
