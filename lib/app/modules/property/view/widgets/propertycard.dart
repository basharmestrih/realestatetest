import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/routes/app_pages.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';
import 'package:my_house_app/generated/locales.g.dart';

class PropertyCard extends StatelessWidget {
  final List<String> imageUrls;
  final String? videoUrl;
  final String location;
  final String address;
  final String name;
  final String price;
  final String description;
  final bool isSell;
  final bool isRent;
  final bool isFurnitured;
  final int? roomsNumber;
  final int? bathsNumber;
  final int? floorsNumber;
  final int? groundDistance;
  final int? buildingAge;
  final List<String>? mainFeatures;

  const PropertyCard({
    super.key,
    required this.imageUrls,
    this.videoUrl,
    required this.location,
    required this.address,
    required this.name,
    required this.price,
    required this.description,
    required this.isSell,
    required this.isRent,
    required this.isFurnitured,
    this.roomsNumber,
    this.bathsNumber,
    this.floorsNumber,
    this.groundDistance,
    this.buildingAge,
    this.mainFeatures,
  });

  Widget _buildLabelValue(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: Colors.grey[700],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
                color: AppColors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with Sell/Rent badge
          Stack(
            children: [
              Image.network(
                imageUrls.isNotEmpty
                    ? imageUrls[0]
                    : 'https://via.placeholder.com/250x180.png?text=No+Image',
                width: double.infinity,
                height: 250.h,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 250.h,
                  color: Colors.grey[300],
                  child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                ),
              ),
              Positioned(
                top: 12.h,
                right: 12.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    isSell
                        ? 'for_sale_category'.tr
                        : isRent
                            ? 'for_rent_category'.tr
                            : '',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Location + Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        location,
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      price,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.numbersfontcolor,
                          ),
                    ),
                  ],
                ),

                SizedBox(height: 6.h),

                // Address
                Row(
                  children: [
                    Icon(Icons.location_on, color: AppColors.numbersfontcolor, size: 25.sp),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        address,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.grey),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 6.h),

                // Rooms, Ground Distance, Floors, Building Age
                if (roomsNumber != null)
                  _buildLabelValue(LocaleKeys.roomsnumber.tr, roomsNumber.toString()),
                if (groundDistance != null)
                  _buildLabelValue(LocaleKeys.area_label.tr, groundDistance.toString()),
                if (floorsNumber != null)
                  _buildLabelValue(LocaleKeys.floors_number.tr, floorsNumber.toString()),
                if (buildingAge != null)
                  _buildLabelValue(LocaleKeys.building_age.tr, buildingAge.toString()),

                // Main Features
                if (mainFeatures != null && mainFeatures!.isNotEmpty)
                  _buildLabelValue(LocaleKeys.features.tr, mainFeatures!.take(3).join(", ")),

                SizedBox(height: 2.h),

                // Property Name / Description
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.h),

                // Contact Seller Button
                ResponsiveButton(
                  buttonHeight: 45.h,
                  buttonWidth: double.infinity,
                  clickable: true,
                  onPressed: () {
                    Get.toNamed(
                      Routes.PROPERTYDETAILS,
                      arguments: {
                        'imgUrls': imageUrls,
                        'videoUrl': videoUrl,
                        'location': location,
                        'address': address,
                        'title': name,
                        'price': price,
                        'description': description,
                        'roomsNumber': roomsNumber,
                        'bathsNumber': bathsNumber,
                        'floorsNumber': floorsNumber,
                        'groundDistance': groundDistance,
                        'buildingAge': buildingAge,
                        'mainFeatures': mainFeatures,
                        'isSell': isSell,
                        'isRent': isRent,
                        'isFurnitured': isFurnitured,
                      },
                    );
                  },
                  child: Text(
                    'contact_seller_button'.tr,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
