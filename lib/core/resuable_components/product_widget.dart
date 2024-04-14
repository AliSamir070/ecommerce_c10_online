
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_c10_online/core/utils/strings_manager.dart';
import 'package:ecommerce_c10_online/domain/entities/product_entity/ProductEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/assets_manager.dart';

class ProductWidget extends StatelessWidget {
  ProductEntity productEntity;
  ProductWidget({super.key,required this.productEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:191.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
          width: 2.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r)
                ),
                child: CachedNetworkImage(
                    imageUrl: productEntity.imageCover??"",
                    width: 191.w,
                    height: 128.h,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
                    errorWidget: (context, url, error) => Icon(Icons.error,size: 30.sp,),
                ),
              ),
              SvgPicture.asset(
                AssetsManager.whishlistIcon,
                height: 30.h,
                width: 30.w,
              )
            ],
          ),
          SizedBox(height: 8.h,),
          Text(
            "${productEntity.title}\n\n"??"",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400
            ),
          ),
          SizedBox(height: 8.h,),
          productEntity.priceAfterDiscount==null
              ?Text(
            "EGP ${productEntity.price}",
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400
            ),
          )
              :Row(
            children: [
              Text(
                "EGP ${productEntity.priceAfterDiscount}",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(width: 16.w,),
              Text(
                "${productEntity.price} EGP",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColor.withOpacity(0.6),
                    decoration: TextDecoration.lineThrough,
                  decorationStyle: TextDecorationStyle.solid
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h,),
          SizedBox(
            width: 191.w,
            child: Row(
              children: [
                Text(
                  "${StringsManager.review} (${productEntity.ratingsAverage})",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400
                  ),
                ),
                SvgPicture.asset(
                  AssetsManager.starIcon,
                  height: 15.h,
                  width: 15.w,
                ),
                Spacer(),
                SvgPicture.asset(
                  AssetsManager.plusIcon,
                  height: 30.h,
                  width: 30.w,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
