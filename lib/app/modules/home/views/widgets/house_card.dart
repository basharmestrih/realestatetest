import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/theme/colors.dart';
import '../../../../data/models/home_model.dart';
import '../../../../routes/app_pages.dart';
import '../../../../widgets/responsive_buttun.dart';

class HouseCard extends StatelessWidget {
  final HomeModel house;
  final bool isEnglish;

  const HouseCard({
    super.key,
    required this.house,
    required this.isEnglish,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 275.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // LEFT IMAGE
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.horizontal(
                left: isEnglish ? Radius.zero : Radius.circular(16.r),
                right: isEnglish ? Radius.circular(16.r) : Radius.zero,
              ),
              child: house.imgUrls.isNotEmpty
                  ? Image.network(
                      house.imgUrls.first,
                      fit: BoxFit.cover,
                      height: double.infinity,
                    )
                  : Container(
                      color: Colors.grey[300],
                      child: const Icon(Icons.home, size: 40, color: Colors.grey),
                    ),
            ),
          ),

          // RIGHT CONTENT
          Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.horizontal(
                  left: isEnglish ? Radius.zero : Radius.circular(16.r),
                  right: isEnglish ? Radius.circular(16.r) : Radius.zero,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TITLE
                  Text(
                    house.title ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 12.h),

                  /// LOCATION
                  Text(
                    house.location ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  SizedBox(height: 6.h),

                  /// ADDRESS
                  Text(
                    house.address ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  SizedBox(height: 23.h),

                  /// MAIN FEATURES (2 ONLY)
                  if (house.mainFeatures != null && house.mainFeatures!.isNotEmpty)
                    ...house.mainFeatures!.take(2).map(
                      (feature) => Container(
                        margin: EdgeInsets.only(bottom: 8.h),
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          feature,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: AppColors.fontcolor),
                        ),
                      ),
                    ),

                  const Spacer(),

                  /// BUTTON
                  Center(
                    child: ResponsiveButton(
                      buttonHeight: 45.h,
                      buttonWidth: double.infinity,
                      clickable: true,
                      buttonStyle: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: AppColors.secondary,
                      ),
                      onPressed: () {
                        Get.toNamed(Routes.PROPERTYDETAILS, arguments: {
                          'videoUrl': house.videoUrl,
                          'imgUrls': house.imgUrls,
                          'location': house.location,
                          'address': house.address,
                          'title': house.title,
                          'price': '\$${house.price}',
                          'description': house.description,
                          'roomsNumber': house.roomsNumber,
                          'bathsNumber': house.bathsNumber,
                          'floorsNumber': house.floorsNumber,
                          'groundDistance': house.groundDistance,
                          'buildingAge': house.buildingAge,
                          'mainFeatures': house.mainFeatures,
                          'isSell': house.isSell,
                          'isRent': house.isRent,
                          'isFurnitured': house.isFurnitured,
                        });
                      },
                      child: Text(
                        'show_more_button'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(color: AppColors.secondary),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

