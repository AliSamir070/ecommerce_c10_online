import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/domain/entities/category_entity/CategoryEntity.dart';

abstract class CategoriesRepo{
  Future<Either<List<CategoryEntity>,String>?>getCategories();
}