import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/data/dao/datasource_contract/categories_datasource/CategoriesDataSource.dart';
import 'package:ecommerce_c10_online/data/model/categories_response/categoryModel.dart';

import 'package:ecommerce_c10_online/domain/entities/category_entity/CategoryEntity.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/repository_contract/categories_repo/CategoriesRepo.dart';

@Injectable(as: CategoriesRepo)
class CategoriesRepoImpl extends CategoriesRepo {
  CategoriesDatasource apiDatasource;

  @factoryMethod
  CategoriesRepoImpl(this.apiDatasource);

  @override
  Future<Either<List<CategoryEntity>, String>?> getCategories() async {
    var result = await apiDatasource.getCategories();

    return result.fold((categoriesResponse) {
      List<CategoryModel> categories = categoriesResponse.data??[];
      List<CategoryEntity> categoriesEntites =
      categories.map((categoryModel) => categoryModel.toCategoryEntity()).toList();
      return Left(categoriesEntites);
    }, (error) {
      print(error);
      return Right(error);
    });

  }
}
