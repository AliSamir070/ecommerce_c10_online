import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/domain/repository_contract/categories_repo/CategoriesRepo.dart';
import 'package:injectable/injectable.dart';

import '../entities/category_entity/CategoryEntity.dart';
@injectable
class GetCategoriesUseCase{
  CategoriesRepo categoriesRepo;
  @factoryMethod
  GetCategoriesUseCase(this.categoriesRepo);

  Future<Either<List<CategoryEntity>, String>?> call(){
    return categoriesRepo.getCategories();
  }
}