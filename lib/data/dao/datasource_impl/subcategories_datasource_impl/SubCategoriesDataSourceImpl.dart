import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/core/api/api_manager.dart';
import 'package:ecommerce_c10_online/core/api/endpoints.dart';
import 'package:ecommerce_c10_online/data/dao/datasource_contract/subcategories_datasource/SubcategoriesDataSource.dart';
import 'package:ecommerce_c10_online/data/model/subcategories_response/SubCategoresResponse.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: SubcategoriesDataSource)
class SubCategoriesDataSourceImpl extends SubcategoriesDataSource{
  ApiManager apiManager;
  @factoryMethod
  SubCategoriesDataSourceImpl(this.apiManager);
  @override
  Future<Either<SubCategoresResponse, String>> getSubCategories(String categoryId) async{
    try{
      var response = await apiManager.getRequest(endpoint: Endpoints.subCategoriesOfCategoryEndpoint(categoryId));
      return Left(SubCategoresResponse.fromJson(response.data));
    }catch(error){
      return Right(error.toString());
    }
  }

}