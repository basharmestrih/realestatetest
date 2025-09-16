import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/modules/mainscreen/controllers/mainbar_controller.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final String imgUrl;

  const ServiceCard({
    super.key,
    required this.title,
    required this.icon,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
     onTap: () => Get.find<MainbarController>().changeBody(1),

      child: Container(
        width: double.infinity,
        height: 180.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          image: DecorationImage(
            image: AssetImage(imgUrl), // use NetworkImage if it's online
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Overlay color for dark effect
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Colors.black.withOpacity(0.4),
              ),
            ),
      
            // Positioned title
            Positioned(
              bottom: 10.h,
              left: 0,
              right: 0,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Center(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          color: AppColors.lightGrey,
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
