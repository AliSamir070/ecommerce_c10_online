import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/domain/entities/brand_entity/BrandEntity.dart';

abstract class BrandsRepo{
  Future<Either<List<BrandEntity>,String>> getBrands();
}