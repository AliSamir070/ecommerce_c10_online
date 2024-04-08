import 'package:ecommerce_c10_online/domain/usecases/get_brands_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/brand_entity/BrandEntity.dart';
import '../../../../../domain/entities/category_entity/CategoryEntity.dart';
import '../../../../../domain/usecases/get_categories_use_case.dart';
@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  @factoryMethod
  HomeTabViewModel(this.categoriesUseCase , this.brandsUseCase) : super(HomeTabInitialState());

  GetCategoriesUseCase categoriesUseCase;
  GetBrandsUseCase brandsUseCase;
  static HomeTabViewModel get(context) => BlocProvider.of(context);

  getCategories() async {
    emit(CategoriesLoadingState());
    var result = await categoriesUseCase.call();
    result?.fold((categories) {
      emit(CategoriesSuccessState(categories));
    }, (error) {
      emit(CategoriesErrorState(error));
    });
  }

  getBrands()async{
    emit(BrandsLoadingState());
    var result = await brandsUseCase.call();
    result.fold((brands){
      emit(BrandsSuccessState(brands));
    }, (error) {
      emit(BrandsErrorState(error));
    });
  }
}

abstract class HomeTabStates {}

class HomeTabInitialState extends HomeTabStates {}

class CategoriesLoadingState extends HomeTabStates {}

class CategoriesSuccessState extends HomeTabStates {
  List<CategoryEntity> categories;

  CategoriesSuccessState(this.categories);
}

class CategoriesErrorState extends HomeTabStates {
  String error;

  CategoriesErrorState(this.error);
}

class BrandsLoadingState extends HomeTabStates{}
class BrandsSuccessState extends HomeTabStates{
  List<BrandEntity> brands;
  BrandsSuccessState(this.brands);
}
class BrandsErrorState extends HomeTabStates{
  String error;
  BrandsErrorState(this.error);
}
