import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/domain/entities/product_entity/ProductEntity.dart';

abstract class ProductsRepo{
  Future<Either<List<ProductEntity>,String>>getProducts({String? sort});
}