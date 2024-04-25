import 'package:ecommerce_c10_online/data/model/products_response/ProductModel.dart';
import 'package:ecommerce_c10_online/domain/entities/cart_response_entity/CartItemEntity.dart';

/// count : 6
/// _id : "66281b3232051602778eaa8d"
/// product : "6428cbd5dc1175abc65ca037"
/// price : 749

class CartItemModel {
  CartItemModel({
      this.count, 
      this.id, 
      this.product, 
      this.price,});

  CartItemModel.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] is! String
    ?ProductModel.fromJson(json['product'])
    :null;
    price = json['price'];
  }
  int? count;
  String? id;
  ProductModel? product;
  int? price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = count;
    map['_id'] = id;
    map['product'] = product;
    map['price'] = price;
    return map;
  }

  CartItemEntity toCartItemEntity(){
    return CartItemEntity(
      id: id,
      product: product?.toProductEntity(),
      count: count,
      price:price
    );
  }
}