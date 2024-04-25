import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_c10_online/domain/entities/cart_response_entity/CartItemEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/assets_manager.dart';

class CartItemWidget extends StatelessWidget {
  CartItemEntity cartItemEntity;
  CartItemWidget({super.key,required this.cartItemEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3)
        )
      ),
      child: Row(
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.3)
                )
            ),
            child: CachedNetworkImage(
                imageUrl: cartItemEntity.product?.imageCover??"",
                height: 113.h,
                width: 120.w,
                placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
                errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(width: 8.w,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(
                    cartItemEntity.product?.title??"",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w500,

                    ),
                  )),
                  SvgPicture.asset(
                    AssetsManager.delete
                  )
                ],
              ),
              SizedBox(height: 10.h,),
              Row(
                children: [
                  Text(
                    "EGP ${cartItemEntity.price??0}",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                  Spacer(),
                  Container(
                    padding: REdgeInsets.all(11),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(20.r)
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(AssetsManager.subtract),
                        SizedBox(width: 10.w,),
                        Text((cartItemEntity.count??0).toString(),style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.sp
                        ),),
                        SizedBox(width: 10.w,),
                        SvgPicture.asset(AssetsManager.add),
                      ],
                    ),
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}
