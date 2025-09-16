import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/data/models/others_model.dart';
import 'package:my_house_app/app/routes/app_pages.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';
import 'package:my_house_app/generated/locales.g.dart';

class OthersCard extends StatelessWidget {
  final List<String> imageUrls;
  final String location;
  final String address;
  final String name;
  final int price;
  final String description;
  final int? areaDistance;
  final int? arealength;
  final int? areawidth;
  final int? floorsNumber;
  final List<String>? mainFeatures;

  const OthersCard({
    Key? key,
    required this.imageUrls,
    required this.location,
    required this.address,
    required this.name,
    required this.price,
    required this.description,
    this.areaDistance,
    this.arealength,
    this.areawidth,
    this.floorsNumber,
    this.mainFeatures,
  }) : super(key: key);

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
          // Image
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
                        style: Theme.of(context).textTheme.titleLarge,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                       '\$${price.toString()}',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.numbersfontcolor,
                          ),
                    ),
                  ],
                ),

                SizedBox(height: 10.h),

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

                // Distance, Length, Width, Floors
                _buildLabelValue(LocaleKeys.distance.tr, '${areaDistance ?? 0}'),
                _buildLabelValue(LocaleKeys.meterical_dimension.tr, '${arealength ?? 0}'),
                _buildLabelValue(LocaleKeys.meterical_width.tr, '${areawidth ?? 0}'),

                SizedBox(height: 6.h),

                // Main Features
                if (mainFeatures != null && mainFeatures!.isNotEmpty)
                  _buildLabelValue(LocaleKeys.features.tr, mainFeatures!.take(3).join(", ")),

                SizedBox(height: 6.h),

                // Property Name / Description
                Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.h),
              

                SizedBox(height: 12.h),

                // Contact Seller Button
                ResponsiveButton(
                  buttonHeight: 45.h,
                  buttonWidth: double.infinity,
                  clickable: true,
                  onPressed: () {
                    Get.toNamed(
                      Routes.OTHERSDETAILS,
                      arguments: {
                        'imgUrls': imageUrls,
                        'location': location,
                        'address': address,
                        'title': name,
                        'price': price,
                        'description': description,
                        'floorsNumber': floorsNumber,
                        'areaDistance': areaDistance,
                        'arealength': arealength,
                        'areawidth': areawidth,
                        'mainFeatures': mainFeatures,
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
