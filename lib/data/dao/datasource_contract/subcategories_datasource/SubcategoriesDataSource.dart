import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/data/model/subcategories_response/SubCategoresResponse.dart';

abstract class SubcategoriesDataSource{
  Future<Either<SubCategoresResponse , String>> getSubCategories(String categoryId);
}