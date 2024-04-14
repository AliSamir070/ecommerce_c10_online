import 'package:ecommerce_c10_online/core/resuable_components/product_widget.dart';
import 'package:ecommerce_c10_online/presentation/home/tabs/home_tab/viewmodel/home_tab_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MostSellingProductsListWidget extends StatefulWidget {
  const MostSellingProductsListWidget({super.key});

  @override
  State<MostSellingProductsListWidget> createState() => _MostSellingProductsListWidgetState();
}

class _MostSellingProductsListWidgetState extends State<MostSellingProductsListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<HomeTabViewModel>().getMostSellingProducts();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel , HomeTabStates>(
        buildWhen: (previous, current) {
          if(current is MostSellingProductsSuccessState || current is MostSellingProductsErrorState || current is MostSellingProductsLoadingState){
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if(state is MostSellingProductsErrorState){
            return Center(child: Text(state.error));
          }
          if(state is MostSellingProductsSuccessState){
            return SizedBox(
              height: 250.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ProductWidget(productEntity: state.products[index]),
                  separatorBuilder: (context, index) => SizedBox(width: 20.w,),
                  itemCount: state.products.length),
            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
    );
  }
}
