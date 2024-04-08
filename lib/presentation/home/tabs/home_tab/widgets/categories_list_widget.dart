import 'package:ecommerce_c10_online/presentation/home/tabs/home_tab/viewmodel/home_tab_viewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'category_widget.dart';

class CategoriesListWidget extends StatefulWidget {
  CategoriesListWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesListWidget> createState() => _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      HomeTabViewModel.get(context).getCategories();
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeTabViewModel, HomeTabStates>(
      listenWhen: (prevState , currentState){
       if(currentState is CategoriesErrorState)return true;
       if(currentState is CategoriesLoadingState)return true;
       if(currentState is CategoriesSuccessState)return true;
       return false;
      },
      buildWhen:(prevState , currentState){
        if(currentState is CategoriesSuccessState)return true;
        return false;
      },
      builder: (context, state) {
        if(state is CategoriesSuccessState){
          return SizedBox(
            height: 288.h,
            child: GridView.builder(
                scrollDirection: Axis.horizontal,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2
                ),
                itemCount: state.categories.length,
                itemBuilder: (context, index) => CategoryWidget(category: state.categories[index],)
            ),
          );
        }
        return Container();
      },
      listener: (BuildContext context, HomeTabStates state) {
        print("state: $state");
        if(state is CategoriesLoadingState){
          showDialog(context: context, builder: (context) => AlertDialog(
            content: SizedBox(
                height:70.h,
                child: Center(child: CircularProgressIndicator(),)),
          ),);
        }
        if(state is CategoriesErrorState){
          showDialog(context: context, builder: (context) => AlertDialog(
            content: SizedBox(
                height:70.h,
                child: Center(child:Text(state.error),)),
          ),);
        }
        if(state is CategoriesSuccessState){
          Navigator.pop(context);
        }
      },
    );
  }
}
