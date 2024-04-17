import 'package:ecommerce_c10_online/domain/usecases/get_categories_use_case.dart';
import 'package:ecommerce_c10_online/domain/usecases/get_subcategories_of_specific_category.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../domain/entities/category_entity/CategoryEntity.dart';
import '../../../../../domain/entities/product_entity/SubcategoryEntity.dart';
@injectable
class CategoriesTabViewModel extends Cubit<CategoriesTabStates>{
  @factoryMethod
  CategoriesTabViewModel(this.getCategoriesUseCase,this.subCategoriesUseCase):super(CategoriesTabInitialState());

  static CategoriesTabViewModel get(context)=>BlocProvider.of(context);
  GetCategoriesUseCase getCategoriesUseCase;
  GetSubcategoriesOfSpecificCategoryUseCase subCategoriesUseCase;
  getCategories()async{
    emit(GetCategoriesLoadingState());
    var result = await getCategoriesUseCase.call();
    result?.fold((categories){
      emit(GetCategoriesSuccessState(categories));
    }, (error) {
      emit(GetCategoriesErrorState(error));
    });
  }
  getSubCategories(String categoryId)async{
    emit(SubCategoriesLoadingState());
    var result = await subCategoriesUseCase.call(categoryId);
    result.fold((subcategories){
      emit(SubCategoriesSuccessState(subcategories));
    }, (error){
      emit(SubCategoriesErrorState(error));
    });
  }

}
abstract class CategoriesTabStates{}
class CategoriesTabInitialState extends CategoriesTabStates{}
class GetCategoriesLoadingState extends CategoriesTabStates{}
class GetCategoriesErrorState extends CategoriesTabStates{
  String error;
  GetCategoriesErrorState(this.error);
}
class GetCategoriesSuccessState extends CategoriesTabStates{
  List<CategoryEntity> categories;
  GetCategoriesSuccessState(this.categories);
}
class SubCategoriesLoadingState extends CategoriesTabStates{}
class SubCategoriesErrorState extends CategoriesTabStates{
  String error;
  SubCategoriesErrorState(this.error);
}
class SubCategoriesSuccessState extends CategoriesTabStates{
  List<SubcategoryEntity> subcategories;
  SubCategoriesSuccessState(this.subcategories);
}