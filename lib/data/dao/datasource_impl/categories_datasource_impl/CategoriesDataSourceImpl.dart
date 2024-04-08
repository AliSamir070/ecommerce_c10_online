import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/core/api/api_manager.dart';
import 'package:ecommerce_c10_online/data/dao/datasource_contract/categories_datasource/CategoriesDataSource.dart';
import 'package:ecommerce_c10_online/data/model/categories_response/CategoriesResponse.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/endpoints.dart';

@Injectable(as: CategoriesDatasource)
class CategoriesDataSourceImpl extends CategoriesDatasource{
  ApiManager apiManager;
  @factoryMethod
  CategoriesDataSourceImpl(this.apiManager); //constructor injection
  @override
  Future<Either<CategoriesResponse , String>> getCategories() async{
    try{
      var response = await apiManager.getRequest(endpoint: Endpoints.categoriesEndpoint);
      return Left(CategoriesResponse.fromJson(response.data));
    }catch(error){
      return Right(error.toString());
    }
  }

}