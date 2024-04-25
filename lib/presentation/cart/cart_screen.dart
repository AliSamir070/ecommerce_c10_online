import 'package:ecommerce_c10_online/core/DI/di.dart';
import 'package:ecommerce_c10_online/presentation/cart/view_model/cart_view_model_cubit.dart';
import 'package:ecommerce_c10_online/presentation/cart/widget/cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/utils/assets_manager.dart';
import '../../core/utils/strings_manager.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CartViewModel>()..GetCart(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(StringsManager.cart),
          centerTitle: true,
        ),
        body: Padding(
          padding: REdgeInsets.all(16.0),
          child: BlocBuilder<CartViewModel, CartViewModelState>(
            builder: (context, state) {
              if(state is CartViewModelSuccessState){
                return Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => CartItemWidget(
                            cartItemEntity: state.cartResponseEntity.data!.products![index],
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            height: 15.h,
                          ),
                          itemCount: state.cartResponseEntity.data?.products?.length??0),
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              StringsManager.totalPrice,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.6)),
                            ),
                            SizedBox(
                              height: 12.h,
                            ),
                            Text(
                              "EGP ${state.cartResponseEntity.data?.totalCartPrice??0}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30.w,
                        ),
                        Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  Theme.of(context).colorScheme.primary),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    StringsManager.checkOut,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  SvgPicture.asset(AssetsManager.arrow)
                                ],
                              ),
                            ))
                      ],
                    )
                  ],
                );
              }
              if(state is CartViewModelErrorState){
                return Center(child: Text(state.error),);
              }
              return Center(child: CircularProgressIndicator(),);
            },
          ),
        ),
      ),
    );
  }
}
