import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/data/model/products_response/ProductsResponse.dart';

abstract class ProductsDataSource{
  Future<Either<ProductsResponse,String>> getProducts({String? sort});
}

enum ProductsSorting{
  MostSelling("-sold"),
  LeastSelling("sold"),
  MostExpensive("-price"),
  LeastExpensive("price");

  final String sort;
  const ProductsSorting(this.sort);
}
