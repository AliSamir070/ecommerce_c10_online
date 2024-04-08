import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/core/api/api_manager.dart';

import 'package:ecommerce_c10_online/data/model/brands_response/BrandsResponse.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/api/endpoints.dart';
import '../../datasource_contract/brands_datasource/BrandsDataSource.dart';

@Injectable(as: BrandDataSource)
class BrandsDatasourceImpl extends BrandDataSource{
  ApiManager apiManager;
  @factoryMethod
  BrandsDatasourceImpl(this.apiManager);
  @override
  Future<Either<BrandsResponse, String>> getBrands() async{
    try{
      var response = await  apiManager.getRequest(endpoint: Endpoints.brandsEndpoint);
      return Left(BrandsResponse.fromJson(response.data));
    }catch(error){
      return Right(error.toString());
    }
  }

}