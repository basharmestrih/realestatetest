
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


import '../../generated/locales.g.dart';
import '../data/services/locale_service.dart';
import '../data/services/theme_service.dart';
import '../routes/app_pages.dart';

import 'bindings/app_binding.dart';
import 'theme/colors.dart';
import 'theme/themes.dart';

final ThemeController themeController = Get.put(ThemeController());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
   Get.find<LocaleService>().getLocale();


  // Set the system UI overlay style globally before running the app
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarContrastEnforced: true,
    systemStatusBarContrastEnforced: true,
    statusBarColor: AppColors.primary, // Set your desired color here
    statusBarIconBrightness: Brightness.light, // Icon brightness (light or dark)
    systemNavigationBarColor: AppColors.primary, // Navigation bar color
    systemNavigationBarIconBrightness: Brightness.light, // Navigation bar icon brightness
    statusBarBrightness: Brightness.light,
    systemNavigationBarDividerColor: AppColors.primary,
  ));


  runApp(
    ScreenUtilInit(
      designSize: const Size(402, 874),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Application",
          themeMode: themeController.theme,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          initialBinding: AppBinding(),
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          translationsKeys: AppTranslation.translations,
          locale: Get.find<LocaleService>().getLocale(), 
          fallbackLocale: const Locale('en', 'US'),
          // Wrap MaterialApp with AnnotatedRegion to apply the system UI style globally
          builder: (context, child) {
            return AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle(
                systemNavigationBarContrastEnforced: true,
                systemStatusBarContrastEnforced: true,
                statusBarColor: AppColors.primary,
                statusBarIconBrightness: Brightness.light,
                systemNavigationBarColor: AppColors.primary,
                systemNavigationBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.light,
                systemNavigationBarDividerColor: AppColors.primary,
              ),
              child: child!,
            );
          },
        );
      },
    ),
  );
}


//for the dark mode button
//  onTap:() {
//
//             if (Get.isDarkMode) {
//               // Change the theme mode to light mode
//               themeController.changeThemeMode(ThemeMode.light);
//               themeController.saveTheme(false);
//             } else {
//               // Change the theme mode to dark mode
//               themeController.changeThemeMode(ThemeMode.dark);
//               themeController.saveTheme(true);
//             }
//
//         }