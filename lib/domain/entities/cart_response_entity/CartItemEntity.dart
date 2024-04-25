import 'package:ecommerce_c10_online/domain/entities/product_entity/ProductEntity.dart';


class CartItemEntity {
  CartItemEntity({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  int? count;
  String? id;
  ProductEntity? product;
  int? price;


}