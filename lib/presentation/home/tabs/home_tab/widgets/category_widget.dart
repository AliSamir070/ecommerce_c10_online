import 'package:ecommerce_c10_online/domain/entities/category_entity/CategoryEntity.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CategoryWidget extends StatelessWidget {
  CategoryEntity category;
  CategoryWidget({Key? key,required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: category.image??"",
          progressIndicatorBuilder: (context, url, progress) => Center(child: CircularProgressIndicator(),),
          errorWidget: (context, url, error) => Icon(Icons.error,size: 20.sp,),
          imageBuilder: (context, imageProvider) => CircleAvatar(
            radius: 50.r,
            backgroundImage: imageProvider,
          ),
        ),
        Text(category.name??"",style: Theme.of(context).textTheme.labelSmall,)
      ],
    );
  }
}
