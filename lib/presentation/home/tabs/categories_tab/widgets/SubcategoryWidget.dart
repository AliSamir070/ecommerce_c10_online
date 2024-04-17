import 'package:ecommerce_c10_online/domain/entities/product_entity/SubcategoryEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/assets_manager.dart';

class SubcategoryWidget extends StatelessWidget {
  final SubcategoryEntity subCategory;
  const SubcategoryWidget({super.key,required this.subCategory});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70.h,
          width: 70.w,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(5.r)
          ),
          child:SvgPicture.asset(
            AssetsManager.route,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        SizedBox(height: 8.h,),
        Text(subCategory.name??"",style: Theme.of(context).textTheme.headlineMedium?.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400
        ),)
      ],
    );
  }
}
