import 'package:ecommerce_c10_online/config/theme/mytheme.dart';
import 'package:ecommerce_c10_online/core/utils/routes_manager.dart';
import 'package:ecommerce_c10_online/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),

      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        title: 'Flutter Demo',
        routes: {
          RoutesManager.homeRouteName:(_)=>HomeScreen()
        },
        initialRoute: RoutesManager.homeRouteName,
        theme: MyTheme.lightTheme,
      ),
    );
  }
}
