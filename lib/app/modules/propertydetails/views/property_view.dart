import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/modules/propertydetails/controllers/property_controller.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Appbar.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Location_Address_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/PropertySituation_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Property_Features_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Property_Display_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Property_Statistics_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Naming_Cost_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Property_Description_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Property_Video_widget.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';

class PropertyDetails extends StatelessWidget {
  const PropertyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PropertyDetailsController());

    return Scaffold(
      extendBody: true,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PropertyGallery(imageUrls: controller.imgUrls),
            Padding(
              padding:  EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  TitlePriceRow(
                    title: controller.title,
                    price: controller.price,
                  ),
                  SizedBox(height: 16.h),
                  DescriptionRow(description: controller.description),
                  SizedBox(height: 20.h),
                  PropertySituation(
                    isSell: controller.isSell,
                    isRent: controller.isRent,
                    isFurnitured: controller.isFurnitured,
                  ),
                  SizedBox(height: 20.h),
                  LocationAddressWidget(
                    location: controller.location,
                    address: controller.address,
                  ),
                  SizedBox(height: 20.h),
                  PropertyFeatures(features: controller.mainFeatures),
                 
                ],
              ),
            ),
             Padding(
               padding: EdgeInsets.fromLTRB(0,10.h,10.w,10.h),
               child: Propertystatistics(
                      roomsNumber: controller.roomsNumber,
                      bathsNumber: controller.bathsNumber,
                      floorsNumber: controller.floorsNumber,
                      groundDistance: controller.groundDistance,
                      buildingAge: controller.buildingAge,
                    ),
             ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.openWhatsApp('963982083231');
        },
        backgroundColor: AppColors.secondary,
        foregroundColor: Colors.black,   // icon color
        elevation: 6,
        child: const Icon(Icons.phone),
      ),

   
    );
  }
}
