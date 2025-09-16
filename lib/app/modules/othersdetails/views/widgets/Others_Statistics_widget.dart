import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/generated/locales.g.dart';

class OthersStatistics extends StatelessWidget {
  final int? areaDistance;
  final int? arealength;
  final int? floorsNumber;
  final int? areawidth;

  const OthersStatistics({
    super.key,
    required this.areaDistance,
    required this.arealength,
    required this.floorsNumber,
    required this.areawidth,
  });

  @override
  Widget build(BuildContext context) {
  final features = [
    {'icon': Icons.square_foot, 'label': '$areaDistance ${LocaleKeys.area.tr}'},

    {'icon': Icons.height_outlined, 'label': '$arealength ${LocaleKeys.dimension_unit.tr}'},
    {'icon': Icons.width_full, 'label': '$areawidth ${LocaleKeys.dimension_unit.tr}'},
    {'icon': Icons.roofing_sharp, 'label': '$floorsNumber ${LocaleKeys.floors.tr}'},
  ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'label_market_specs'.tr,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(color:AppColors.fontcolor),
        ),
         SizedBox(height: 24.h),
        SizedBox(
          height: 120.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: features.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, index) {
              final item = features[index];
              return FeatureCard(
                icon: item['icon'] as IconData,
                label: item['label'] as String,
              );
            },
          ),
        ),
      ],
    );
  }
}


class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String label;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      height: 180.h,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      decoration: BoxDecoration(
        //color: Colors.white,
        border: Border.all(
          color: const Color.fromARGB(255, 227, 223, 223),
          width: 3,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 38, color: Colors.black87),
          const SizedBox(height: 6),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
