import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/domain/repository_contract/subcategories_repo/SubCategorieRepo.dart';
import 'package:injectable/injectable.dart';

import '../entities/product_entity/SubcategoryEntity.dart';
@injectable
class GetSubcategoriesOfSpecificCategoryUseCase{
  SubCategoriesRepo repo;
  @factoryMethod
  GetSubcategoriesOfSpecificCategoryUseCase(this.repo);
  Future<Either<List<SubcategoryEntity>, String>> call(String categoryId)=>repo.getSubCategories(categoryId);
}