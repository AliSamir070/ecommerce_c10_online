import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/data/dao/datasource_contract/cart_datasource/CartDataSource.dart';
import 'package:ecommerce_c10_online/domain/entities/cart_response_entity/CartResponseEntity.dart';
import 'package:ecommerce_c10_online/domain/repository_contract/cart_repo/CartRepo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CartRepo)
class CartRepoImpl extends CartRepo{
  CartDataSource apiDatasource;
  @factoryMethod
  CartRepoImpl(this.apiDatasource);
  @override
  Future<Either<CartResponseEntity, String>> AddToCart({required String productId}) async{
    var result = await apiDatasource.AddToCart(productId: productId);
    return result.fold((response){
      CartResponseEntity cartResponseEntity = response.toCartResponseEntity();
      return Left(cartResponseEntity);
    }, (error){
      return Right(error);
    });
  }

  @override
  Future<Either<CartResponseEntity, String>> GetCart() async{
    var result = await apiDatasource.GetCart();
    return result.fold((response){
      CartResponseEntity cartResponseEntity = response.toCartResponseEntity();
      return Left(cartResponseEntity);
    }, (error){
      return Right(error);
    });
  }

}