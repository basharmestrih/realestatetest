import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/modules/propertydetails/controllers/property_controller.dart';
import 'package:my_house_app/app/modules/propertydetails/views/widgets/video_Bottom_Sheet_widget.dart';

import '../../controllers/othersdetails_controller.dart';

class OthersVideoWidget extends StatefulWidget {
  const OthersVideoWidget({super.key});

  

  @override
  State<OthersVideoWidget> createState() => _OthersVideoState();
  
}

class _OthersVideoState extends State<OthersVideoWidget> {
  bool _isHovered = false;
      final controller = Get.put(OthersdetailsController());


void _openVideoBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.black,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) => Padding(
      padding:  EdgeInsets.fromLTRB(0, 0, 0, 48.h) ,// spacing top & bottom
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [


          // Video taking full width but fixed height
          Container(
            width: double.infinity,
            height: 300.h, 
            child: StableVideoPlayerWidget(
              videoUrl: controller.videoUrl,
            ),
          ),

          // Optional bottom spacing
           SizedBox(height: 24.h),

          // Optional extra content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
             controller.title ,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color:  AppColors.secondary
                    ),
            ),
          ),
        ],
      ),
    ),
  );
}


  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => _openVideoBottomSheet(context),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: _isHovered
                ? Theme.of(context).colorScheme.secondary.withOpacity(0.8)
                : Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.play_arrow, color: Colors.black, size: 20.sp),
              SizedBox(width: 6.w),
              Text(
                'player_button_text'.tr,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Colors.black,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
