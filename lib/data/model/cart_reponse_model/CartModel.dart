import 'package:ecommerce_c10_online/domain/entities/cart_response_entity/CartEntity.dart';

import 'CartItemModel.dart';

/// _id : "66281b3232051602778eaa8c"
/// cartOwner : "66241bdcbe8b523235e12810"
/// products : [{"count":6,"_id":"66281b3232051602778eaa8d","product":"6428cbd5dc1175abc65ca037","price":749},{"count":1,"_id":"66281dd032051602778ebac9","product":"6428ead5dc1175abc65ca0ad","price":149},{"count":1,"_id":"662940f6320516027791b654","product":"6428ebc6dc1175abc65ca0b9","price":160}]
/// createdAt : "2024-04-23T20:33:54.450Z"
/// updatedAt : "2024-04-24T17:27:18.666Z"
/// __v : 2
/// totalCartPrice : 4803

class CartModel {
  CartModel({
      this.id, 
      this.cartOwner, 
      this.products, 
      this.createdAt, 
      this.updatedAt, 
      this.v, 
      this.totalCartPrice,});

  CartModel.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(CartItemModel.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
  String? id;
  String? cartOwner;
  List<CartItemModel>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['cartOwner'] = cartOwner;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    map['totalCartPrice'] = totalCartPrice;
    return map;
  }

  CartEntity toCartEntity(){
    return CartEntity(
      totalCartPrice: totalCartPrice,
      products: products?.map((e) => e.toCartItemEntity()).toList(),
      id: id,
      cartOwner: cartOwner
    );
  }
}