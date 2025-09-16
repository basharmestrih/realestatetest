import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';

class OthersFeatures extends StatelessWidget {
  final List<String> features;

  const OthersFeatures({
    super.key,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'label_features'.tr,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(color:AppColors.fontcolor),

        ),
        const SizedBox(height: 6),
        ...features.map(
          (feature) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Row(
              children: [
                   Icon(
                  Icons.check_sharp,
                  weight: 2000,
                  color: AppColors.black,
                  size: 25.sp,
                ),
                 const SizedBox(width: 8),
                 Text(
                  feature,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
               
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}
