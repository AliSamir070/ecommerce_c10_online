import 'package:ecommerce_c10_online/core/local/PrefsHelper.dart';
import 'package:ecommerce_c10_online/core/utils/routes_manager.dart';
import 'package:ecommerce_c10_online/presentation/home/home_view_model.dart';
import 'package:ecommerce_c10_online/presentation/home/tabs/categories_tab/categories_tab.dart';
import 'package:ecommerce_c10_online/presentation/home/tabs/home_tab/home_tab.dart';
import 'package:ecommerce_c10_online/presentation/home/tabs/profile_tab/profile_tab.dart';
import 'package:ecommerce_c10_online/presentation/home/tabs/whishlist_tab/whishlist_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/assets_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
static List<Widget> tabs = [
  HomeTab(),
  CategoriesTab(),
  WhishlistTab(),
  ProfileTab()
];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeStates>(
      builder: (context, state) {
        HomeViewModel homeViewModel = HomeViewModel.get(context);
        return Scaffold(
          appBar: AppBar(
            title: SvgPicture.asset(
              AssetsManager.route,
              width: 66.w,
              height: 22.h,
            ),
            actions: [
              IconButton(
                  onPressed: (){
                    Navigator.pushNamed(context, RoutesManager.cartRouteName);
                  },
                  icon: SvgPicture.asset(AssetsManager.cart)
              ),
              IconButton(onPressed: (){
                PrefsHelper.clearToken();
                Navigator.pushNamedAndRemoveUntil(context, RoutesManager.loginRouteName, (route) => false);
              }, icon: Icon(Icons.logout))
            ],
          ),
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.circular(40.r),
            child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex:homeViewModel.currentTabIndex,
                onTap: (newIndex){
                  homeViewModel.changeTabIndex(newIndex);
                },
                items: [
                  BottomNavigationBarItem(icon: SvgPicture.asset(
                    AssetsManager.homeUnSelected,
                    height: 40.h,
                    width: 40.w,
                  ), activeIcon: SvgPicture.asset(
                    AssetsManager.homeSelected,
                    height: 40.h,
                    width: 40.w,
                  ), label: "", backgroundColor: Theme
                      .of(context)
                      .colorScheme
                      .primary),
                  BottomNavigationBarItem(icon: SvgPicture.asset(
                    AssetsManager.categoriesUnSelected,
                    height: 40.h,
                    width: 40.w,
                  ), activeIcon: SvgPicture.asset(
                    AssetsManager.categoriesSelected,
                    height: 40.h,
                    width: 40.w,
                  ), label: ""),
                  BottomNavigationBarItem(icon: SvgPicture.asset(
                    AssetsManager.whishlistUnSelected,
                    height: 40.h,
                    width: 40.w,
                  ), activeIcon: SvgPicture.asset(
                    AssetsManager.whishlistSelected,
                    height: 40.h,
                    width: 40.w,
                  ), label: ""),
                  BottomNavigationBarItem(icon: SvgPicture.asset(
                    AssetsManager.profileUnSelected,
                    height: 40.h,
                    width: 40.w,
                  ), activeIcon: SvgPicture.asset(
                    AssetsManager.profileSelected,
                    height: 40.h,
                    width: 40.w,
                  ), label: "")
                ]
            ),
          ),
          body: tabs[homeViewModel.currentTabIndex],
        );
      },
    );
  }
}
