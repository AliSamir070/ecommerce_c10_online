import 'package:ecommerce_c10_online/data/model/categories_response/categoryModel.dart';
import 'package:ecommerce_c10_online/domain/entities/product_entity/ProductEntity.dart';

import '../brands_response/BrandModel.dart';
import 'SubcategoryModel.dart';


/// sold : 43660
/// images : ["https://ecommerce.routemisr.com/Route-Academy-products/1680395220690-1.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680395220693-3.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680395220692-2.jpeg","https://ecommerce.routemisr.com/Route-Academy-products/1680395220713-4.jpeg"]
/// subcategory : [{"_id":"6407f243b575d3b90bf957ac","name":"Men's Clothing","slug":"men's-clothing","category":"6439d5b90049ad0b52b90048"}]
/// ratingsQuantity : 19
/// _id : "6428cbd5dc1175abc65ca037"
/// title : "Essentials Embroidered Linear Logo T-Shirt Navy"
/// slug : "essentials-embroidered-linear-logo-t-shirt-navy"
/// description : "Comfortable and soft cotton blend fabric\nRibbed crew neck and short sleeves\nadidas signature branding print\nWash according to care label instructions"
/// quantity : 118
/// price : 749
/// priceAfterDiscount : 504
/// imageCover : "https://ecommerce.routemisr.com/Route-Academy-products/1680395220407-cover.jpeg"
/// category : {"_id":"6439d5b90049ad0b52b90048","name":"Men's Fashion","slug":"men's-fashion","image":"https://ecommerce.routemisr.com/Route-Academy-categories/1681511865180.jpeg"}
/// brand : {"_id":"64089c3924b25627a2531593","name":"Adidas","slug":"adidas","image":"https://ecommerce.routemisr.com/Route-Academy-brands/1678285881943.png"}
/// ratingsAverage : 3.8
/// createdAt : "2023-04-02T00:27:01.864Z"
/// updatedAt : "2024-04-11T01:01:13.738Z"
/// id : "6428cbd5dc1175abc65ca037"

class ProductModel {
  ProductModel({
      this.sold, 
      this.images, 
      this.subcategory, 
      this.ratingsQuantity, 
      this.id, 
      this.title, 
      this.slug, 
      this.description, 
      this.quantity, 
      this.price, 
      this.priceAfterDiscount, 
      this.imageCover, 
      this.category, 
      this.brand, 
      this.ratingsAverage, 
      this.createdAt, 
      this.updatedAt,});

  ProductModel.fromJson(dynamic json) {
    sold = json['sold'];
    images = json['images'] != null ? json['images'].cast<String>() : [];
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryModel.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    priceAfterDiscount = json['priceAfterDiscount'];
    imageCover = json['imageCover'];
    category = json['category'] != null ? CategoryModel.fromJson(json['category']) : null;
    brand = json['brand'] != null ? BrandModel.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
  }
  int? sold;
  List<String>? images;
  List<SubcategoryModel>? subcategory;
  int? ratingsQuantity;
  String? id;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  int? priceAfterDiscount;
  String? imageCover;
  CategoryModel? category;
  BrandModel? brand;
  num? ratingsAverage;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sold'] = sold;
    map['images'] = images;
    if (subcategory != null) {
      map['subcategory'] = subcategory?.map((v) => v.toJson()).toList();
    }
    map['ratingsQuantity'] = ratingsQuantity;
    map['title'] = title;
    map['slug'] = slug;
    map['description'] = description;
    map['quantity'] = quantity;
    map['price'] = price;
    map['priceAfterDiscount'] = priceAfterDiscount;
    map['imageCover'] = imageCover;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    if (brand != null) {
      map['brand'] = brand?.toJson();
    }
    map['ratingsAverage'] = ratingsAverage;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['id'] = id;
    return map;
  }

  ProductEntity toProductEntity(){
    return ProductEntity(
      title: title,
      category: category?.toCategoryEntity(),
      id: id,
      slug: slug,
      subcategory: subcategory?.map((subcategoryModel) => subcategoryModel.toSubCategoryEntity()).toList(),
      sold:sold,
      ratingsQuantity: ratingsQuantity,
      ratingsAverage: ratingsAverage,
      quantity: quantity,
      priceAfterDiscount: priceAfterDiscount,
      price: price,
      images: images,
      imageCover: imageCover,
      description: description,
      brand: brand?.toBrandEntity()
    );
  }
}