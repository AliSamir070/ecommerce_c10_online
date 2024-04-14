import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/data/dao/datasource_contract/products_datasource/productsDataSource.dart';
import 'package:ecommerce_c10_online/domain/repository_contract/products_repo/ProductsRepo.dart';
import 'package:injectable/injectable.dart';

import '../entities/product_entity/ProductEntity.dart';
@injectable
class GetMostSellingProductsUseCase{
  ProductsRepo productsRepo;
  @factoryMethod
  GetMostSellingProductsUseCase(this.productsRepo);

  Future<Either<List<ProductEntity>, String>> call()=>productsRepo.getProducts(sort: ProductsSorting.MostSelling.sort);
}