import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/core/theme/themes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onMenuPressed;

  const CustomAppBar({super.key, required this.onMenuPressed});

  @override
  Size get preferredSize => Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu_rounded, size: 28.r, color:Theme.of(context).colorScheme.errorContainer),
        onPressed: onMenuPressed,
      ),
      title: Center(
        child: Text(
          'Sorina',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color:Theme.of(context).colorScheme.error,
          fontSize: 30.sp,
          letterSpacing: 7.sp),
          
        ),
      ),
      actions: [
       
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: ThemeSwitchButton(),
        ),
        /*Padding(
  padding: EdgeInsets.only(right: 12.w), // Optional: more spacing
  child: SizedBox(
    width: 40.w,
    height: 40.w,
    child: Center(
      child: SvgPicture.asset(
        'assets/logos/logo-svg.svg',
        width: 40.w, // adjust size here
        height: 40.w,
      ),
    ),
  ),
),*/

      ],
      centerTitle: true,
    );
  }
}



class ThemeSwitchButton extends StatelessWidget {
  const ThemeSwitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Reactive theme check
    bool isDark = Get.isDarkMode;

    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 77, 76, 76),
        borderRadius: BorderRadius.circular(30.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Light mode button
          GestureDetector(
            onTap: () => Get.changeTheme(AppTheme.lightTheme),
            child: Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                color: !isDark ? Colors.grey[400] : Colors.grey[300],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.wb_sunny,
                size: 20.r,
                color: !isDark ? Colors.white : Colors.black45,
              ),
            ),
          ),
          SizedBox(width: 8.w),

          // Dark mode button
          GestureDetector(
            onTap: () => Get.changeTheme(AppTheme.darkTheme),
            child: Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                color:Color.fromARGB(255, 0, 0, 0),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.nightlight_round,
                size: 20.r,
                color: isDark ? AppColors.secondary : AppColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}