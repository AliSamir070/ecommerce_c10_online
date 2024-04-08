import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_c10_online/domain/entities/brand_entity/BrandEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandWidget extends StatelessWidget {
  BrandEntity brand;
  BrandWidget({Key? key,required this.brand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: brand.image??"",
          progressIndicatorBuilder: (context, url, progress) => Center(child: CircularProgressIndicator(),),
          errorWidget: (context, url, error) => Icon(Icons.error,size: 20.sp,),
          imageBuilder: (context, imageProvider) => CircleAvatar(
            radius: 60.r,
            backgroundImage: imageProvider,
            backgroundColor: Theme.of(context).colorScheme.primary,
          ),
        ),
        Text(brand.name??"",style: Theme.of(context).textTheme.labelSmall,)
      ],
    );
  }
}
