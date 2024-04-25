import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/domain/entities/cart_response_entity/CartResponseEntity.dart';

abstract class CartRepo{
  Future<Either<CartResponseEntity , String>>AddToCart({required String productId});
  Future<Either<CartResponseEntity , String>> GetCart();
}