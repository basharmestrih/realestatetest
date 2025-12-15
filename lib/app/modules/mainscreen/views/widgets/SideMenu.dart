import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/data/services/locale_service.dart';
import 'package:my_house_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:my_house_app/app/modules/mainscreen/controllers/mainbar_controller.dart';
import 'package:my_house_app/app/routes/app_pages.dart';
import 'package:my_house_app/app/data/services/token_service.dart';

class SideMenu extends StatelessWidget {
  final VoidCallback onToggleLanguage;
  
  

  const SideMenu({super.key, required this.onToggleLanguage});

  @override
  Widget build(BuildContext context) {
    final MainbarController mainbarController = Get.find<MainbarController>();

    final LocaleService localeService = Get.find();
    final authController = Get.find<AuthController>();
    


    return Drawer(
      backgroundColor: AppColors.secondary,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 80.h, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerItem(title: 'home'.tr, icon: Icons.home, onTap: () {
              Navigator.of(context).pop();

              Get.find<MainbarController>().changeBodyByName("home");


            }),
            SizedBox(height: 16.sp),
           FutureBuilder<bool>(
          future: mainbarController.checkIfUserIsAdmin(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // Loading indicator
            } else if (snapshot.hasData && snapshot.data == true) {
              return Column(
                children: [
                  DrawerItem(
                    title: 'Dashboard'.tr,
                    icon: Icons.dashboard,
                    onTap: () {
                      Get.toNamed(Routes.DashBoard);
                    },
                  ),
                  SizedBox(height: 16.sp),
                ],
              );
            }
            return const SizedBox.shrink(); // Empty if not admin
          },
        ),

             
           
            DrawerItem(title: 'properties_sale'.tr, icon: Icons.sell, onTap: () {
              Navigator.of(context).pop();

                Get.find<MainbarController>().changeBodyByName("property");
            }),
            SizedBox(height: 16.sp),
            DrawerItem(title: 'properties_rent'.tr, icon: Icons.apartment, onTap: () {
            Get.find<MainbarController>().changeBodyByName("property");
             Navigator.of(context).pop();

            }),
            SizedBox(height: 16.sp),
            DrawerItem(title: 'farms_sale'.tr, icon: Icons.nature, onTap: () {
              Navigator.of(context).pop();

              Get.find<MainbarController>().changeBodyByName("others");
            }),
            SizedBox(height: 16.sp),
            DrawerItem(title: 'add_property'.tr, icon: Icons.add, onTap: () {
              Navigator.of(context).pop();

              Get.toNamed(Routes.ASKFORAD);
            }),
            SizedBox(height: 16.sp),
            DrawerItem(title: 'ask_consultant'.tr, icon: Icons.engineering, onTap: () {
              Navigator.of(context).pop();

              Get.find<MainbarController>().changeBodyByName("architects");
              
            }),
            SizedBox(height: 16.sp),
authController.isLoggedIn
    ? DrawerItem(
        title: 'logout_button'.tr,
        icon: Icons.logout,
        onTap: () async {
          await authController.logout();
        },
        color: Colors.red,
      )
    : DrawerItem(
        title: 'buttons_login'.tr,
        icon: Icons.login,
        onTap: () {
          Get.toNamed(Routes.AUTH);
        },
        color: AppColors.numbersfontcolor,
      ),

            SizedBox(height: 16.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('language_switch'.tr, style: TextStyle(fontSize: 16.sp, color: Colors.grey[800])),
                Switch(
                  activeColor: Colors.black,
                  value: Get.locale?.languageCode == 'ar',
                  onChanged: (bool value) {
                    localeService.toggleLocale();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
    final Color? color; 

  const DrawerItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
     this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: color ?? Colors.black),
      title: Text(title, style: TextStyle(fontSize: 17.sp,color: color ?? Colors.black)),
      onTap: onTap,
    );
  }
}
