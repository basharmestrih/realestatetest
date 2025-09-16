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
      backgroundColor: AppColors.primary,
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
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.symmetric(vertical: 6.h , horizontal: 40.w),
        child: ResponsiveButton(
          onPressed: () {
            controller.openWhatsApp('963937138915');
          },
          clickable: true,
          buttonStyle: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
            ),
          ),
          buttonWidth: Get.width / 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('buttons_chat_on_whatsapp'.tr),
              SizedBox(width:30.w),
              Icon(Icons.person ,color: AppColors.fontcolor,size: 30.sp,)
            ],
          ),
        ),
      ),
    );
  }
}
