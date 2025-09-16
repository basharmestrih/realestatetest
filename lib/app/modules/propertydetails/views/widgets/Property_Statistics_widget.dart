import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/generated/locales.g.dart';

class Propertystatistics extends StatelessWidget {
  final int roomsNumber;
  final int bathsNumber;
  final int floorsNumber;
  final int groundDistance;
  final int buildingAge;

  const Propertystatistics({
    super.key,
    required this.roomsNumber,
    required this.bathsNumber,
    required this.floorsNumber,
    required this.groundDistance,
    required this.buildingAge,
  });

  @override
  Widget build(BuildContext context) {
  final features = [
    {'icon': Icons.bed, 'label': '$roomsNumber ${LocaleKeys.rooms.tr}'},
    {'icon': Icons.bathtub, 'label': '$bathsNumber ${LocaleKeys.bathrooms.tr}'},
    {'icon': Icons.home_filled, 'label': '$floorsNumber ${LocaleKeys.floors.tr}'},
    {'icon': Icons.square_foot, 'label': '$groundDistance ${LocaleKeys.area.tr}'},
    {'icon': Icons.calendar_today, 'label': '$buildingAge ${LocaleKeys.age.tr}'},
  ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'label_what_will_you_get'.tr,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color:AppColors.fontcolor),
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
            style: Theme.of(context).textTheme.labelSmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
