import 'package:ecommerce_c10_online/domain/usecases/get_brands_use_case.dart';
import 'package:ecommerce_c10_online/domain/usecases/get_most_selling_products_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/brand_entity/BrandEntity.dart';
import '../../../../../domain/entities/category_entity/CategoryEntity.dart';
import '../../../../../domain/entities/product_entity/ProductEntity.dart';
import '../../../../../domain/usecases/get_categories_use_case.dart';
@injectable
class HomeTabViewModel extends Cubit<HomeTabStates> {
  @factoryMethod
  HomeTabViewModel(this.categoriesUseCase , this.brandsUseCase,this.mostSellingProductsUseCase) : super(HomeTabInitialState());

  GetCategoriesUseCase categoriesUseCase;
  GetBrandsUseCase brandsUseCase;
  GetMostSellingProductsUseCase mostSellingProductsUseCase;
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

  getMostSellingProducts()async{
    emit(MostSellingProductsLoadingState());
    var result = await mostSellingProductsUseCase.call();
    result.fold((products){
      emit(MostSellingProductsSuccessState(products));
    }, (error){
      emit(MostSellingProductsErrorState(error));
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
class MostSellingProductsLoadingState extends HomeTabStates{}
class MostSellingProductsSuccessState extends HomeTabStates{
  List<ProductEntity> products;
  MostSellingProductsSuccessState(this.products);
}
class MostSellingProductsErrorState extends HomeTabStates{
  String error;
  MostSellingProductsErrorState(this.error);
}
