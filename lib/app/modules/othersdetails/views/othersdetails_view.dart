import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/modules/othersdetails/controllers/othersdetails_controller.dart';
import 'package:my_house_app/app/modules/othersdetails/views/widgets/Appbar.dart';
import 'package:my_house_app/app/modules/othersdetails/views/widgets/Location_Address_widget.dart';
import 'package:my_house_app/app/modules/othersdetails/views/widgets/Naming_Cost_widget.dart';
import 'package:my_house_app/app/modules/othersdetails/views/widgets/Others_Description_widget.dart';
import 'package:my_house_app/app/modules/othersdetails/views/widgets/Others_Display_widget.dart';
import 'package:my_house_app/app/modules/othersdetails/views/widgets/Others_Features_widget.dart';
import 'package:my_house_app/app/modules/othersdetails/views/widgets/Others_Situation_widget.dart';
import 'package:my_house_app/app/modules/othersdetails/views/widgets/Others_Statistics_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/controllers/property_controller.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Location_Address_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/PropertySituation_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Property_Features_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Property_Display_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Property_Statistics_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Naming_Cost_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Property_Description_widget.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/Property_Video_widget.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';

class OthersdetailsView extends StatelessWidget {
  const OthersdetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OthersdetailsController());

    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            OthersDisplayWidget(imageUrls: controller.imgUrls),
            Padding(
              padding:  EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 4.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8.h),
                  OthersTitlePriceRow(
                    title: controller.title,
                    price: controller.price,
                  ),
                  SizedBox(height: 16.h),
                  OthersDescriptionRow(description: controller.description),
                  SizedBox(height: 20.h),
                   OthersLocationAddressWidget(
                    location: controller.location,
                    address: controller.address,
                  ),
                   SizedBox(height: 20.h),
                  OthersSituationWidget(
                    isSell: controller.isSell,
                    isRent: controller.isRent,
                  ),
                 
                 
                  SizedBox(height: 20.h),
                  OthersFeatures(features: controller.mainFeatures),
                 
                ],
              ),
            ),
             Padding(
               padding: EdgeInsets.fromLTRB(0,10.h,10.w,10.h),
               child: OthersStatistics(
                      areaDistance: controller.areaDistance,
                      arealength: controller.arealength,
                      floorsNumber: controller.floorsNumber,
                      areawidth: controller.areawidth,
  
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
        foregroundColor: Colors.black,  
        elevation: 6,
        child: const Icon(Icons.phone),
      ),
    
    );
  }
}
