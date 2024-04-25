import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/domain/repository_contract/auth_repo/AuthRepo.dart';
import 'package:injectable/injectable.dart';

import '../entities/auth_entity/AuthEntity.dart';
@injectable
class SignInUseCase{
  AuthRepo authRepo;
  @factoryMethod
  SignInUseCase(this.authRepo);
  Future<Either<AuthEntity, String>> call({required String email , required String password})=>authRepo.SignIn(email: email, password: password);
}