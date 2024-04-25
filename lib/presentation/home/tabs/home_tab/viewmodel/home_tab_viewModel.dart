import 'package:ecommerce_c10_online/domain/entities/cart_response_entity/CartResponseEntity.dart';
import 'package:ecommerce_c10_online/domain/usecases/add_to_cart_usecase.dart';
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
  HomeTabViewModel(this.addToCartUseCase,this.categoriesUseCase , this.brandsUseCase,this.mostSellingProductsUseCase) : super(HomeTabInitialState());

  GetCategoriesUseCase categoriesUseCase;
  GetBrandsUseCase brandsUseCase;
  AddToCartUseCase addToCartUseCase;
  addToCart(String productId)async{
    emit(AddToCartLoadingState(productId));
    var result = await addToCartUseCase.call(productId: productId);
    result.fold((response){
      emit(AddToCartSuccessState(response,productId));
    }, (error){
      emit(AddToCartErrorState(error,productId));
    });
  }
  GetMostSellingProductsUseCase mostSellingProductsUseCase;
  static HomeTabViewModel get(context) => BlocProvider.of(context);

  getCategories() async {
    if(!isClosed){
      emit(CategoriesLoadingState());
    }
    var result = await categoriesUseCase.call();
    result?.fold((categories) {
      if(!isClosed){
        emit(CategoriesSuccessState(categories));
      }
    }, (error) {
      if(!isClosed){
        emit(CategoriesErrorState(error));
      }
    });
  }

  getBrands()async{
    if(!isClosed){
      emit(BrandsLoadingState());
    }
    var result = await brandsUseCase.call();
    result.fold((brands){
      if(!isClosed){
        emit(BrandsSuccessState(brands));
      }
    }, (error) {
      if(!isClosed){
        emit(BrandsErrorState(error));
      }
    });
  }

  getMostSellingProducts()async{
    if(!isClosed){
      emit(MostSellingProductsLoadingState());
    }
    var result = await mostSellingProductsUseCase.call();
    result.fold((products){
      if(!isClosed){
        emit(MostSellingProductsSuccessState(products));
      }
    }, (error){
      if(!isClosed){
        emit(MostSellingProductsErrorState(error));
      }
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
class AddToCartLoadingState extends HomeTabStates{
  String productId;
  AddToCartLoadingState(this.productId);
}
class AddToCartErrorState extends HomeTabStates{
  String error;
  String productId;
  AddToCartErrorState(this.error,this.productId);
}
class AddToCartSuccessState extends HomeTabStates{
  CartResponseEntity responseEntity;
  String productId;
  AddToCartSuccessState(this.responseEntity,this.productId);
}
