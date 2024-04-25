import 'CartEntity.dart';

class CartResponseEntity {
  CartResponseEntity({
      this.status, 
      this.numOfCartItems, 
      this.data,this.message,this.statusMsg});

  String? status;
  String? message;
  String? statusMsg;
  int? numOfCartItems;
  CartEntity? data;

}