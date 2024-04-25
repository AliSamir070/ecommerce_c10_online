import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/core/api/api_manager.dart';
import 'package:ecommerce_c10_online/core/api/endpoints.dart';
import 'package:ecommerce_c10_online/data/dao/datasource_contract/auth_datasource/auth_datasource.dart';
import 'package:ecommerce_c10_online/data/model/auth_response_model/AuthResponse.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthDataSource)
class AuthDatasourceImpl extends AuthDataSource{
  ApiManager apiManager;
  @factoryMethod
  AuthDatasourceImpl(this.apiManager);
  @override
  Future<Either<AuthResponse, String>> SignUp({required String fullName, required String mobile, required String email, required String password}) async{
    try{
      var response = await apiManager.postRequest(endpoint: Endpoints.signupEndpoint,body: {
        "name":fullName,
        "phone":mobile,
        "email":email,
        "password":password,
        "rePassword":password
      });
      AuthResponse authResponse = AuthResponse.fromJson(response.data);
      if(authResponse.statusMsg!=null){
        return Right(authResponse.message??"");
      }else{
        return Left(authResponse);
      }
    }catch(e){
      return Right(e.toString());
    }
  }

  @override
  Future<Either<AuthResponse, String>> SignIn({required String email, required String password}) async{
    try{
      var response = await apiManager.postRequest(endpoint: Endpoints.signInEndpoint,body: {
        "email":email,
        "password":password,
      });
      AuthResponse authResponse = AuthResponse.fromJson(response.data);
      if(authResponse.statusMsg!=null){
        return Right(authResponse.message??"");
      }else{
        return Left(authResponse);
      }
    }catch(e){
      return Right(e.toString());
    }
  }

}