import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_house_app/app/core/theme/colors.dart';
import 'package:my_house_app/app/data/services/locale_service.dart';



class AppTheme {
  final localeService = Get.find<LocaleService>();
  static const String primaryFont = 'Cairo';
  static const String secondaryFont = 'Inter';
  static const String thirdFont = 'Playfair Display';
  //static const String arabicFont = 'Cairo';


  // Define light theme
  static ThemeData get lightTheme {
     Get.put(LocaleService());
     final int fontSizeAdjustment = (Get.locale?.languageCode == 'en') ? 0 : 0;

    return ThemeData(
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.black,
        // new edits
        primaryContainer:AppColors.surface, 
        onPrimaryContainer: Colors.black,  
        onSecondaryContainer: AppColors.secondaryfontcolor, 
        surfaceTint:AppColors.surface,
        primaryFixed: AppColors.white,
        
      ),
      dividerColor: AppColors.surface,
      scaffoldBackgroundColor: AppColors.primary,
      fontFamily:  primaryFont,
   textTheme: TextTheme(
  headlineLarge: TextStyle(
    fontSize: (24.r * 0.83) + fontSizeAdjustment,
    color: AppColors.white,
  ),
  headlineMedium: TextStyle(
    fontSize: (22.r * 0.83) + fontSizeAdjustment,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  ),
  bodyLarge: TextStyle(
    fontSize: (33.r * 0.83) + fontSizeAdjustment,
    color: AppColors.fontcolor,
    fontWeight: FontWeight.w900,
  ),
  bodyMedium: TextStyle(
    fontSize: (16.r * 0.83) + fontSizeAdjustment,
    color: AppColors.secondaryfontcolor,
  ),
  titleLarge: TextStyle(
    fontSize: (26.r * 0.83) + fontSizeAdjustment,
    color: AppColors.fontcolor,
    fontWeight: FontWeight.bold,
  ),
  bodySmall: TextStyle(
    fontSize: (13.r * 0.83) + fontSizeAdjustment,
    color: AppColors.secondaryfontcolor,
    fontWeight: FontWeight.w800,
  ),
  titleMedium: TextStyle(
    fontSize: (14.r * 0.83) + fontSizeAdjustment,
    color: AppColors.fontcolor,
    fontWeight: FontWeight.w800,
  ),
  titleSmall: TextStyle(
    fontSize: (15.r * 0.83) + fontSizeAdjustment,
    color: AppColors.fontcolor,
  ),
  // for numbers
  labelLarge: TextStyle(
    fontSize: (28.r * 0.83) + fontSizeAdjustment,
    fontWeight: FontWeight.bold,
    color: AppColors.numbersfontcolor,
  ),
  labelMedium: TextStyle(
    fontSize: (26.r * 0.83) + fontSizeAdjustment,
    fontWeight: FontWeight.bold,
    color: AppColors.secondaryfontcolor,
  ),
  labelSmall: TextStyle(
    fontSize: (12.r * 0.83) + fontSizeAdjustment,
    fontWeight: FontWeight.bold,
    color: AppColors.fontcolor,
  ),
),
 
      appBarTheme: AppBarTheme(
        elevation: 2,
        iconTheme: IconThemeData(color: AppColors.surface),
        titleTextStyle: TextStyle(fontSize: 22.r, fontWeight: FontWeight.bold, color: AppColors.surface),
      ),
      // ✅ Custom Checkbox Theme
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.r), 
      ),
      side: BorderSide(
        width: 2.w, // Thicker border
        color: AppColors.black, // Border color
      ),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.primary; // Fill color when checked
        }
        return Colors.transparent; // Transparent when unchecked
      }),
      checkColor: MaterialStateProperty.all(Colors.black), // Checkmark color
    ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.responsiveButtonColor,
          foregroundColor: AppColors.fontcolor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 12.h),
          textStyle: TextStyle(fontFamily: LocaleService.instance.fontType,fontSize: 16.r, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.surface,
      ),
      //new edits
      /*cardTheme: CardTheme(
      color: Colors.grey[200],
      shadowColor: Colors.black12,
      elevation: 4,
      margin: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),*/
    //new edits
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.grey[100],
      elevation: 8,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black45,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
    ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide.none),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide(color: AppColors.primary)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r), borderSide: BorderSide(color: AppColors.primary, width: 2.w)),
        labelStyle: TextStyle(color: AppColors.primary),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: AppColors.primary,
        contentTextStyle: TextStyle(color: AppColors.surface),
      ),
      /*dialogTheme: DialogTheme(
        backgroundColor: AppColors.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        titleTextStyle: TextStyle(fontSize: 20.r, fontWeight: FontWeight.bold, color: AppColors.primary),
        contentTextStyle: TextStyle(fontSize: 16.r, color: AppColors.primary),
      ),*/
    );
  }

  // Define dark theme
static ThemeData get darkTheme {
  return ThemeData(
    colorScheme: ColorScheme.dark(
      primary: Colors.black,
      secondary: AppColors.secondary,
      error: AppColors.secondary,
      primaryContainer:Color(0xFF1A1A1A),
      onPrimaryContainer: Colors.white,
       onSecondaryContainer: AppColors.white ,
      surfaceTint:Colors.black,
      primaryFixed: const Color.fromARGB(255, 109, 108, 108).withOpacity(0.1),
    ),
    scaffoldBackgroundColor: Colors.black,
    fontFamily: LocaleService.instance.fontType,

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: (24.r * 0.83),
        color: Colors.white,
      ),
      headlineMedium: TextStyle(
        fontSize: (22.r * 0.83),
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        fontSize: (33.r * 0.83),
        color: Colors.white,
        fontWeight: FontWeight.w900,
      ),
      bodyMedium: TextStyle(
        fontSize: (16.r * 0.83),
        color: AppColors.secondaryfontcolor.withOpacity(0.8),
      ),
      titleLarge: TextStyle(
        fontSize: (26.r * 0.83),
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontSize: (13.r * 0.83),
        color: AppColors.secondaryfontcolor.withOpacity(0.8),
        fontWeight: FontWeight.w800,
      ),
      titleMedium: TextStyle(
        fontSize: (14.r * 0.83),
        color: Colors.white,
        fontWeight: FontWeight.w800,
      ),
      titleSmall: TextStyle(
        fontSize: (15.r * 0.83),
        color: Colors.white,
      ),
      labelLarge: TextStyle(
        fontSize: (28.r * 0.83),
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      labelMedium: TextStyle(
        fontSize: (26.r * 0.83),
        fontWeight: FontWeight.bold,
        color: Colors.white70,
      ),
      labelSmall: TextStyle(
        fontSize: (12.r * 0.83),
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),

    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 2,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        fontSize: 22.r,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    ),

    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6.r),
      ),
      side: BorderSide(
        width: 2.w,
        color: Colors.white,
      ),
      fillColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return AppColors.secondary;
        }
        return Colors.transparent;
      }),
      checkColor: MaterialStateProperty.all(Colors.white),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.secondary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 12.h),
        textStyle: TextStyle(
          fontFamily: LocaleService.instance.fontType,
          fontSize: 16.r,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.secondary,
      foregroundColor: Colors.white,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.black,
      elevation: 8,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white70,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
      type: BottomNavigationBarType.fixed,
      showUnselectedLabels: true,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white.withOpacity(0.1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: AppColors.secondary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: BorderSide(color: AppColors.secondary, width: 2.w),
      ),
      labelStyle: TextStyle(color: Colors.white),
    ),

    snackBarTheme: SnackBarThemeData(
      backgroundColor: Colors.black,
      contentTextStyle: TextStyle(color: Colors.white),
    ),
  );
}

}
