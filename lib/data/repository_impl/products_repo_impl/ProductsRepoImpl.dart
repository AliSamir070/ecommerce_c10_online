import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/data/dao/datasource_contract/products_datasource/productsDataSource.dart';
import 'package:ecommerce_c10_online/data/model/products_response/ProductModel.dart';
import 'package:ecommerce_c10_online/domain/entities/product_entity/ProductEntity.dart';
import 'package:ecommerce_c10_online/domain/repository_contract/products_repo/ProductsRepo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: ProductsRepo)
class ProductsRepoImpl extends ProductsRepo{
  ProductsDataSource apiDatasource;
  @factoryMethod
  ProductsRepoImpl(this.apiDatasource);
  @override
  Future<Either<List<ProductEntity>, String>> getProducts({String? sort}) async{
    var result = await apiDatasource.getProducts(sort: sort);
    return result.fold((response) {
      List<ProductModel> productModelList = response.data??[];
      List<ProductEntity> productEntityList = productModelList.map((productModel) => productModel.toProductEntity()).toList();
      return Left(productEntityList);
    }, (error) {
      return Right(error);
    });
  }

}