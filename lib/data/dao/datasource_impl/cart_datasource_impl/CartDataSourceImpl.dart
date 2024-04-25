import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/core/api/api_manager.dart';
import 'package:ecommerce_c10_online/core/api/endpoints.dart';
import 'package:ecommerce_c10_online/core/local/PrefsHelper.dart';
import 'package:ecommerce_c10_online/data/dao/datasource_contract/cart_datasource/CartDataSource.dart';
import 'package:ecommerce_c10_online/data/model/cart_reponse_model/CartResponseModel.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: CartDataSource)
class CartDataSourceImpl extends CartDataSource{
  ApiManager apiManager;
  @factoryMethod
  CartDataSourceImpl(this.apiManager);
  @override
  Future<Either<CartResponseModel, String>> AddToCart({required String productId}) async{
    try{
      var response = await apiManager.postRequest(endpoint: Endpoints.cartEndpoint,body: {
        "productId":productId
      },headers: {
        "token":PrefsHelper.getToken()
      });
      CartResponseModel cartResponseModel = CartResponseModel.fromJson(response.data);
      if(cartResponseModel.statusMsg!=null){
        return Right(cartResponseModel.message??"");
      }else{
        return Left(cartResponseModel);
      }

    }catch(error){
      return Right(error.toString());
    }
  }

  @override
  Future<Either<CartResponseModel, String>> GetCart() async{
    try{
      var response = await apiManager.getRequest(endpoint: Endpoints.cartEndpoint,headers: {
        "token":PrefsHelper.getToken()
      });
      CartResponseModel cartResponseModel = CartResponseModel.fromJson(response.data);
      if(cartResponseModel.statusMsg!=null){
        return Right(cartResponseModel.message??"");
      }else{
        return Left(cartResponseModel);
      }
    }catch(error){
      return Right(error.toString());
    }
  }

}