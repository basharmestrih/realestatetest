import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import '../controllers/splash_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo image
          Image.asset(
          'assets/lastlogo.png', 
          width: 400.w, 
          height: 400.h, 
        ),


            const SizedBox(height: 30),

            // Optional: you can keep the app name below the logo
            // Text(
            //   'Sorina',
            //   style: TextStyle(
            //     fontSize: 28,          // smaller than before
            //     fontWeight: FontWeight.bold,
            //     color: Colors.black,
            //     letterSpacing: 1.2,
            //   ),
            // ),

            const SizedBox(height: 20),

            // Circular progress indicator

const SpinKitFadingCircle(
  color: Colors.black,
  size: 100.0,
),
          ],
        ),
      ),
    );
  }
}
