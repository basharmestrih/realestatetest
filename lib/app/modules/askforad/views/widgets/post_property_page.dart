import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/modules/askforad/controllers/AskForAdController.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PostPropertyPage extends StatelessWidget {
  const PostPropertyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Askforadcontroller());

    // List of images for carousel
    final List<String> carouselImages = [
      'assets/images/Askforad.jpg',

    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        /// 🔥 Carousel Slider
  Padding(
    padding:  EdgeInsets.only(top:15.h),
    child: Container(
    width: double.infinity,
    child: AspectRatio(
      aspectRatio: 14 / 9,
      child: CarouselSlider.builder(
        itemCount: carouselImages.length,
        itemBuilder: (context, index, realIndex) {
          final imgPath = carouselImages[index];
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Stack(
                children: [
                  // Background Image
                  Positioned.fill(
                    child: Image.asset(
                      imgPath,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
    
               
    
              ),
            ),
          );
        },
        options: CarouselOptions(
          height: 400.h,
          viewportFraction: 0.98,
          enlargeCenterPage: true,
        
        ),
      ),
    ),
    ),
  ),

        SizedBox(height: 48.h),

        /// Text Section
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              Text(
                'first_body_askforsell'.tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge,
              ),
               SizedBox(height: 25.h),
              Text(
                'second_body_askforsell'.tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),

        SizedBox(height: 48.h),
        ContactRow(
          icon: Icons.phone,
          label: 'Whatsapp',
          onPressed: () => controller.openWhatsApp('0937138915'),
        ),
        SizedBox(height: 16.h),
        ContactRow(
          icon: Icons.people,
          label: 'Instagram',
          onPressed: () => controller.openInstagram(),
        ),
        SizedBox(height: 16.h),
        ContactRow(
          icon: Icons.chat,
          label: 'Messenger',
          onPressed: () => controller.openMessenger(),
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
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: SizedBox(
              width: 320.w,
              child: ElevatedButton.icon(
                label: Text(
                  label,
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color:Theme.of(context).colorScheme.error,
                  ),
                ),
                icon: Icon(icon, color: Theme.of(context).colorScheme.error, size: 25.sp),
                iconAlignment: IconAlignment.start,
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
