import 'package:ecommerce_c10_online/core/utils/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTheme{
  static ThemeData lightTheme = ThemeData(
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
      )
    )
  );
}