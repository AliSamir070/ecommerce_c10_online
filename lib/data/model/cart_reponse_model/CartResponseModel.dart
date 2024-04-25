import 'package:ecommerce_c10_online/domain/entities/cart_response_entity/CartResponseEntity.dart';

import 'CartModel.dart';

/// status : "success"
/// message : "Product added successfully to your cart"
/// numOfCartItems : 3
/// data : {"_id":"66281b3232051602778eaa8c","cartOwner":"66241bdcbe8b523235e12810","products":[{"count":6,"_id":"66281b3232051602778eaa8d","product":"6428cbd5dc1175abc65ca037","price":749},{"count":1,"_id":"66281dd032051602778ebac9","product":"6428ead5dc1175abc65ca0ad","price":149},{"count":1,"_id":"662940f6320516027791b654","product":"6428ebc6dc1175abc65ca0b9","price":160}],"createdAt":"2024-04-23T20:33:54.450Z","updatedAt":"2024-04-24T17:27:18.666Z","__v":2,"totalCartPrice":4803}

class CartResponseModel {
  CartResponseModel({
      this.status, 
      this.message, 
      this.numOfCartItems, 
      this.data,this.statusMsg});

  CartResponseModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? CartModel.fromJson(json['data']) : null;
    statusMsg = json['statusMsg'];
  }
  String? status;
  String? message;
  int? numOfCartItems;
  CartModel? data;
  String? statusMsg;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['numOfCartItems'] = numOfCartItems;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

  CartResponseEntity toCartResponseEntity(){
    return CartResponseEntity(
      numOfCartItems: numOfCartItems,
      data: data?.toCartEntity(),
      message: message,
      status: status,
      statusMsg: statusMsg,

    );
  }
}