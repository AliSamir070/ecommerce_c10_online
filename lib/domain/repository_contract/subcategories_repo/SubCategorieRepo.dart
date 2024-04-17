import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/domain/entities/product_entity/SubcategoryEntity.dart';

abstract class SubCategoriesRepo{
  Future<Either<List<SubcategoryEntity> , String>> getSubCategories(String categoryId);
}