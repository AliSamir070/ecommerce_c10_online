import 'package:ecommerce_c10_online/core/DI/di.dart';
import 'package:ecommerce_c10_online/presentation/home/tabs/categories_tab/viewmodel/CategoriesTabViewModel.dart';
import 'package:ecommerce_c10_online/presentation/home/tabs/categories_tab/widgets/SelectionCategoryWidget.dart';
import 'package:ecommerce_c10_online/presentation/home/tabs/categories_tab/widgets/SubcategoryWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors_manager.dart';

class CategoriesTab extends StatefulWidget {
  CategoriesTab({super.key});

  @override
  State<CategoriesTab> createState() => _CategoriesTabState();
}

class _CategoriesTabState extends State<CategoriesTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<CategoriesTabViewModel>()
        ..getCategories(),
      child: BlocConsumer<CategoriesTabViewModel, CategoriesTabStates>(
        buildWhen: (previous, current) {
          if (current is GetCategoriesErrorState ||
              current is GetCategoriesSuccessState ||
              current is GetCategoriesLoadingState) {
            return true;
          }
          return false;
        },
        listener: (context, state) {
          if(state is GetCategoriesSuccessState){
            CategoriesTabViewModel.get(context).getSubCategories(state.categories[selectedIndex].id??"");
          }
        },
        builder: (context, state) {
          if (state is GetCategoriesErrorState) {
            return Center(child: Text(state.error),);
          }
          if (state is GetCategoriesSuccessState) {
            return Row(
              children: [
                Container(
                  width: 137.w,
                  decoration: BoxDecoration(
                      color: ColorsManager.categoriesBackground,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                          color: Theme
                              .of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.3)
                      )
                  ),
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          SelectionCategoryWidget(
                              onSelect: () {
                                selectedIndex = index;
                                setState(() {

                                });
                                CategoriesTabViewModel.get(context).getSubCategories(state.categories[selectedIndex].id??"");
                              },
                              category: state.categories[index],
                              isSelected: index == selectedIndex),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 20.h,),
                      itemCount: state.categories.length
                  ),
                ),
                Expanded(
                    child: BlocBuilder<
                        CategoriesTabViewModel,
                        CategoriesTabStates>(
                      buildWhen: (previous, current) {
                        if(current is SubCategoriesErrorState || current is SubCategoriesSuccessState || current is SubCategoriesLoadingState){
                          return true;
                        }
                        return false;
                      },
                      builder: (context, state) {
                        if(state is SubCategoriesSuccessState){
                          return GridView.builder(
                            itemCount:state.subcategories.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: 16.h,
                                crossAxisSpacing: 16.w,
                                childAspectRatio: 1 / 2
                            ),
                            itemBuilder: (context, index) => SubcategoryWidget(subCategory: state.subcategories[index]),
                          );
                        }
                        if(state is SubCategoriesErrorState){
                          return Center(child: Text(state.error),);
                        }
                        return Center(child: CircularProgressIndicator(),);
                      },
                    )
                )
              ],
            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}
