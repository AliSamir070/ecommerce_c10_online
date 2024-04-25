import 'package:dartz/dartz.dart';
import 'package:ecommerce_c10_online/domain/repository_contract/auth_repo/AuthRepo.dart';
import 'package:injectable/injectable.dart';

import '../entities/auth_entity/AuthEntity.dart';
@injectable
class SignUpUseCase{
  AuthRepo authRepo;
  @factoryMethod
  SignUpUseCase(this.authRepo);

  Future<Either<AuthEntity, String>> call({required String fullName, required String mobile, required String email, required String password})=>authRepo.SignUp(fullName: fullName, mobile: mobile, email: email, password: password);
}