import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/routes/app_pages.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';
import 'package:my_house_app/generated/locales.g.dart';

class PropertyCardDashboard extends StatelessWidget {
  final int id;
  final List<String> imageUrls; // kept if needed for navigation
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

  const PropertyCardDashboard({
    super.key,
    required this.id,
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
                fontSize: 12.sp,
                color: Colors.grey[700],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12.sp,
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
      margin: EdgeInsets.symmetric(vertical: 6.h, horizontal: 8.w),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: Padding(
        padding: EdgeInsets.all(12.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ID and Title Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "ID: $id",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.numbersfontcolor,
                      ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: isSell
                        ? Colors.green.withOpacity(0.15)
                        : Colors.blue.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: Text(
                    isSell
                        ? 'for_sale_category'.tr
                        : isRent
                            ? 'for_rent_category'.tr
                            : '',
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isSell ? Colors.green : Colors.blue,
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),

            // Name
            Text(
              name,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),

            SizedBox(height: 4.h),

            // Location + Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    location,
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  price,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.numbersfontcolor,
                      ),
                ),
              ],
            ),

            Divider(height: 16.h),

            // Compact Property Details
            if (roomsNumber != null)
              _buildLabelValue(LocaleKeys.roomsnumber.tr, roomsNumber.toString()),
            if (bathsNumber != null)
              _buildLabelValue(LocaleKeys.bathrooms.tr, bathsNumber.toString()),
            if (floorsNumber != null)
              _buildLabelValue(LocaleKeys.floors_number.tr, floorsNumber.toString()),
            if (groundDistance != null)
              _buildLabelValue(LocaleKeys.area_label.tr, "$groundDistance m²"),
            if (buildingAge != null)
              _buildLabelValue(LocaleKeys.building_age.tr, "$buildingAge ${"years".tr}"),

            if (mainFeatures != null && mainFeatures!.isNotEmpty)
              _buildLabelValue(
                LocaleKeys.features.tr,
                mainFeatures!.take(2).join(", "),
              ),

            SizedBox(height: 8.h),

            // Dashboard Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.visibility, color: AppColors.fontcolor),
                  onPressed: () {
                    Get.toNamed(
                      Routes.PROPERTYDETAILS,
                      arguments: {
                        'id': id,
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
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    // TODO: hook delete logic
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
