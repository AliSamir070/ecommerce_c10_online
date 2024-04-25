import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/domain/repository_contract/cart_repo/CartRepo.dart';
import 'package:injectable/injectable.dart';

import '../entities/cart_response_entity/CartResponseEntity.dart';

@injectable
class GetCartUseCase{
  CartRepo cartRepo;
  @factoryMethod
  GetCartUseCase(this.cartRepo);

  Future<Either<CartResponseEntity, String>> call()=>cartRepo.GetCart();
}