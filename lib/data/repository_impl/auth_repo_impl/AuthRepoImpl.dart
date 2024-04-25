import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/data/dao/datasource_contract/auth_datasource/auth_datasource.dart';
import 'package:ecommerce_c10_online/domain/entities/auth_entity/AuthEntity.dart';
import 'package:ecommerce_c10_online/domain/repository_contract/auth_repo/AuthRepo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo{
  AuthDataSource apiDatasource;
  @factoryMethod
  AuthRepoImpl(this.apiDatasource);
  @override
  Future<Either<AuthEntity, String>> SignUp({required String fullName, required String mobile, required String email, required String password}) async{
    var result = await apiDatasource.SignUp(fullName: fullName, mobile: mobile, email: email, password: password);
    return result.fold((response) {
      AuthEntity authEntity = response.toAuthEntity();
      return Left(authEntity);
    }, (error){
      return Right(error);
    });
  }

  @override
  Future<Either<AuthEntity, String>> SignIn({required String email, required String password}) async{

    var result = await apiDatasource.SignIn(email: email, password: password);
    return result.fold((response) {
      AuthEntity authEntity = response.toAuthEntity();
      return Left(authEntity);
    }, (error){
      return Right(error);
    });
  }

}