import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/domain/repository_contract/cart_repo/CartRepo.dart';
import 'package:injectable/injectable.dart';

import '../entities/cart_response_entity/CartResponseEntity.dart';
@injectable
class AddToCartUseCase{
  CartRepo cartRepo;
  @factoryMethod
  AddToCartUseCase(this.cartRepo);

  Future<Either<CartResponseEntity, String>> call({required String productId})=>cartRepo.AddToCart(productId: productId);
}