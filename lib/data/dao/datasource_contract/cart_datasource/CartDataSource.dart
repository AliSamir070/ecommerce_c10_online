import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/data/model/cart_reponse_model/CartResponseModel.dart';

abstract class CartDataSource{
  Future<Either<CartResponseModel , String>>AddToCart({required String productId});
  Future<Either<CartResponseModel , String>> GetCart();
}