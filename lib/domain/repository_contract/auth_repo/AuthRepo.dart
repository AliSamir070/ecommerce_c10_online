import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/domain/entities/auth_entity/AuthEntity.dart';

abstract class AuthRepo{
  Future<Either<AuthEntity,String>> SignUp({required String fullName, required String mobile, required String email, required String password});
  Future<Either<AuthEntity,String>> SignIn({required String email, required String password});
}