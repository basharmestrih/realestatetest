import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_house_app/app/core/theme/colors.dart';

class CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 10.r, vertical: 0.h),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondary :Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.all((Radius.circular(10))),
        ),
        child: Center(
          child: Text(
            label,
           style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: isSelected ? AppColors.black : AppColors.grey,
          fontSize: 9.sp,
          height: 0,
  ),
           
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
