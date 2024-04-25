import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/data/model/auth_response_model/AuthResponse.dart';

abstract class AuthDataSource{
  Future<Either<AuthResponse,String>> SignUp({required String fullName,required String mobile , required String email , required String password });

  Future<Either<AuthResponse,String>> SignIn({required String email,required String password});
}