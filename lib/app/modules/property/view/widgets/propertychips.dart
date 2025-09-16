import 'package:flutter/material.dart';
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
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondary : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            label,
           style: Theme.of(context).textTheme.labelSmall?.copyWith(
    color: isSelected ? AppColors.black : AppColors.grey,
  ),
           
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
