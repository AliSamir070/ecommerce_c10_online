import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/data/model/brands_response/BrandsResponse.dart';

abstract class BrandDataSource{
  Future<Either<BrandsResponse , String>> getBrands();
}