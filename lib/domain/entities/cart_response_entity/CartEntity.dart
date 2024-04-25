import 'CartItemEntity.dart';

class CartEntity {
  CartEntity({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.totalCartPrice,});

  String? id;
  String? cartOwner;
  List<CartItemEntity>? products;
  int? totalCartPrice;



}