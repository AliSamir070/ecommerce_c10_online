import 'package:ecommerce_c10_online/domain/entities/product_entity/SubcategoryEntity.dart';

/// _id : "6407f243b575d3b90bf957ac"
/// name : "Men's Clothing"
/// slug : "men's-clothing"
/// category : "6439d5b90049ad0b52b90048"

class SubcategoryModel {
  SubcategoryModel({
      this.id, 
      this.name, 
      this.slug, 
      this.category,});

  SubcategoryModel.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
  String? id;
  String? name;
  String? slug;
  String? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    return map;
  }

  SubcategoryEntity toSubCategoryEntity(){
    return SubcategoryEntity(
      slug: slug,
      id: id,
      category: category,
      name: name
    );
  }
}