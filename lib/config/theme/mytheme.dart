import 'package:ecommerce_c10_online/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTheme{
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      scrolledUnderElevation: 0
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.primaryColor,
      selectedItemColor: ColorsManager.primaryColor,
      unselectedItemColor: ColorsManager.primaryColor,
      type: BottomNavigationBarType.fixed
    ),
    colorScheme: ColorScheme.fromSeed(
        seedColor:ColorsManager.primaryColor,
        primary: ColorsManager.primaryColor
    ),
    textTheme: TextTheme(
      labelSmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400
      ),
      headlineMedium: TextStyle(
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.headlineColor
      ),
      titleMedium: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 24.sp,
        color: Colors.white
      ),
      titleSmall: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 18.sp,
        color: Colors.black
      )
    )
  );
}