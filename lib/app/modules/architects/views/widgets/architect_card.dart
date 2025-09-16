
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/data/models/arhcitect_model.dart';
import 'package:my_house_app/app/data/services/api_endpoints.dart';
import 'package:my_house_app/app/modules/architects/controllers/arhcitects_controller.dart';
import 'package:my_house_app/app/widgets/responsive_buttun.dart';
import 'package:url_launcher/url_launcher.dart';

class ArchitectCard extends StatelessWidget {
  final Architect architect;
  

  const ArchitectCard({super.key, required this.architect});

String? _getFullImageUrl(String? rawUrl) {
  if (rawUrl == null || rawUrl.isEmpty) return null;

  // If already a full URL, return as-is
  if (rawUrl.startsWith('http')) return rawUrl;

  // Otherwise, append base URL
  final uri = Uri.parse(rawUrl);
  return "${ApiEndpoints.baseUrl}${uri.path}";
}


  @override
  Widget build(BuildContext context) {
    final imageUrl = _getFullImageUrl(architect.imageUrl);
    final ArchitectsController controller = Get.find<ArchitectsController>();


    return GestureDetector(
      onTap: () => _showDetailsBottomSheet(context, architect, controller),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 8.r,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: imageUrl == null
                    ? Image.network('', fit: BoxFit.cover)
                    : FadeInImage.assetNetwork(
                  placeholder: 'assets/images/placeholder_blur.png',
                  image: imageUrl,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (_, __, ___) => Image.asset(
                    'assets/images/placeholder_blur.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10.h,
            left: 8.w,
            child:
              Container(
                padding: EdgeInsets.all(4.sp), // Adjust for spacing around the icon
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey[300], // Light gray background
                ),
                child: Icon(
                  Icons.engineering,
                  color: AppColors.numbersfontcolor,
                ),
              ),
          ),

          Positioned(
            bottom: 1.h,
            left: 7.w,
            right: 7.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4.r,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child:Row(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    // Small Navigation Icon
    

    SizedBox(width: 6.w),

    // Info Column
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Text(
                architect.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  
                ),
              ),
                        SizedBox(height: 2.h),

          Row(
            children: [
              Text(
                architect.specialization,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: 10.sp,
                  color: AppColors.numbersfontcolor,
                   fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(width:8.w),
            ],
          ),
            
             
            
          
        ],
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

  void _showDetailsBottomSheet(BuildContext context, Architect architect, ArchitectsController controller,
) {
    final imageUrl = _getFullImageUrl(architect.imageUrl);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) {
        return DraggableScrollableSheet(
  initialChildSize: 0.85,
  minChildSize: 0.5,
  maxChildSize: 0.95,
  expand: false,
  builder: (_, scrollController) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
    child: Column(
      children: [
        // Scrollable Content
        Expanded(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: imageUrl == null
                      ? Image.network(
                          'https://img.freepik.com/premium-photo/girl-architect-engineer-holds-design-plan-her-hands-smiles-girl-designer-projects-design_429338-611.jpg',
                          width: 120.w,
                          height: 120.w,
                          fit: BoxFit.cover)
                      : FadeInImage.assetNetwork(
                          placeholder: 'assets/images/placeholder_blur.png',
                          image: imageUrl!,
                          width: 180.w,
                          height: 180.w,
                          fit: BoxFit.cover,
                          imageErrorBuilder: (_, __, ___) => Image.asset(
                              'assets/images/placeholder_blur.png',
                              width: 120.w,
                              height: 120.w,
                              fit: BoxFit.cover),
                        ),
                ),
                SizedBox(height: 16.h),
                Text(
                  architect.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                SizedBox(height: 32.h),
                _buildInfoRow("specialization".tr, architect.specialization, context),
                _buildInfoRow("university".tr, architect.university, context),
                _buildInfoRow("country".tr, architect.country, context),
                _buildInfoRow("city".tr, architect.city, context),
                if (architect.experience != null)
                  _buildInfoRow("experience".tr, architect.experience!, context),
                _buildInfoRow("languages".tr, architect.languages, context),
                _buildInfoRow("yearsExperience".tr, "${architect.yearsExperience} سنوات", context),
                _buildPhoneRow("phone".tr, architect.phone, context),
                SizedBox(height: 24.h),
              ],
            ),
          ),
        ),

        // Fixed Button at Bottom
        ResponsiveButton(
          onPressed: () {
            controller.openWhatsApp(
      architect.phone, 
      
    );

          },
          clickable: true,
          buttonStyle: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
            ),
          ),
          buttonWidth: 500.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('buttons_chat_on_whatsapp'.tr),
              SizedBox(width: 30.w),
              Icon(Icons.person, color: AppColors.fontcolor, size: 30.sp),
            ],
          ),
        ),
      ],
    ),
  ),
);

      },
    );
  }

  Widget _buildInfoRow(String title, String value,context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 3,
              child: Text("$title:",
                   style: Theme.of(context).textTheme.bodyMedium,)),
          Expanded(
              flex: 5,
              child: Text(value,
                 style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.fontcolor),)),
        ],
      ),
    );
  }

  Widget _buildPhoneRow(String title, String phoneNumber,context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Text("$title:",
             style: Theme.of(context).textTheme.bodyMedium,
               ),
          ),
          Expanded(
            flex: 5,
            child: GestureDetector(
              onTap: () async {
                /*final uri = Uri.parse("tel:$phoneNumber");
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                } else {
                  Get.snackbar("Error", "Could not launch dialer",
                      backgroundColor: Colors.red, colorText: Colors.white);
                }*/
              },
              child: Row(
                children: [
                  Icon(Icons.call, color: AppColors.fontcolor, size: 18.sp),
                  SizedBox(width: 6.w),
                  Text(
                    phoneNumber,
                     style: Theme.of(context).textTheme.bodyMedium!.copyWith(color:AppColors.numbersfontcolor)
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