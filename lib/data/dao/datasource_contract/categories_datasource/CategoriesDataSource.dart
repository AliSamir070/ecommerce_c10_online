import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/data/model/categories_response/CategoriesResponse.dart';

abstract class CategoriesDatasource{
  Future<Either<CategoriesResponse , String>> getCategories();
}