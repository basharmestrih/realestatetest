import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';

class PostPropertyPage extends StatelessWidget {
  const PostPropertyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
  width: double.infinity,
  child: AspectRatio(
    aspectRatio: 10 / 8,
    child: Stack(
      children: [
        Image.asset(
          'assets/images/Askforad.jpg',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
        Positioned(
          left: 25.w,         // distance from the left edge of the image
          top: 45.h,          // distance from the top edge to start the text column
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text(
                'شو',
               style: Theme.of(context).textTheme.bodyLarge,
              ),
              SizedBox(height: 10.h,),
              Text(
                'لسا',
               style: Theme.of(context).textTheme.bodyLarge,
              ),
               SizedBox(height: 10.h,),
              Text(
                'ناطر',
               style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    ),
  ),
),

         SizedBox(height: 24.h),
       Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.w),
            child: Column(
              children: [
                Text(
                  'first_body_askforsell'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Text(
                  'second_body_askforsell'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
        SizedBox(height: 32.h),

        // Replace single button with three contact rows:
        ContactRow(
          icon: Icons.person,
          label: 'Whatsapp',
          onPressed: () {
            // TODO: Implement WhatsApp contact
          },
        ),
         SizedBox(height: 16.h),
        ContactRow(
          icon: Icons.email,
          label: 'G-mail',
          onPressed: () {
            // TODO: Implement Gmail contact
          },
        ),
         SizedBox(height: 16.h),
        ContactRow(
          icon: Icons.phone,
          label: 'Phone',
          onPressed: () {
            // TODO: Implement phone call functionality
          },
        ),
      ],
    );
  }
}

class ContactRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const ContactRow({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.w),
          child: SizedBox(
            width:320.w,
            child: ElevatedButton.icon(
             
              label: Text(label, style: Theme.of(context).textTheme.titleSmall,),
               icon: Icon(icon,color: AppColors.background1,size: 25.sp,),
               iconAlignment: IconAlignment.start ,
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.lightGrey,
                padding: const EdgeInsets.symmetric(vertical: 16 ),
                textStyle: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
