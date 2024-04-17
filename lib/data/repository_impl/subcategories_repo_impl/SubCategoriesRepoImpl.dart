import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/data/dao/datasource_contract/subcategories_datasource/SubcategoriesDataSource.dart';
import 'package:ecommerce_c10_online/data/model/products_response/SubcategoryModel.dart';
import 'package:ecommerce_c10_online/domain/entities/product_entity/SubcategoryEntity.dart';
import 'package:ecommerce_c10_online/domain/repository_contract/subcategories_repo/SubCategorieRepo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: SubCategoriesRepo)
class SubCategoriesRepoImpl extends SubCategoriesRepo{
  SubcategoriesDataSource apiDataSource;
  @factoryMethod
  SubCategoriesRepoImpl(this.apiDataSource);
  @override
  Future<Either<List<SubcategoryEntity>, String>> getSubCategories(String categoryId)async {
    var result = await apiDataSource.getSubCategories(categoryId);
    return result.fold((response){
      List<SubcategoryModel> subcategoriesModelList = response.data??[];
      List<SubcategoryEntity> subcategoriesEntityList = subcategoriesModelList
          .map((subcategoryModel) => subcategoryModel.toSubCategoryEntity()).toList();
      return Left(subcategoriesEntityList);
    }, (error){
      return Right(error);
    });
  }

}