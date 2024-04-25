import 'package:ecommerce_c10_online/domain/entities/auth_entity/AuthEntity.dart';
import 'package:ecommerce_c10_online/domain/usecases/sugnup_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
@injectable
class SignUpViewModel extends Cubit<SignUpStates>{
  @factoryMethod
  SignUpViewModel(this.signUpUseCase):super(SignUpInitialState());

  static SignUpViewModel get(BuildContext context )=>BlocProvider.of(context);

  SignUpUseCase signUpUseCase;

  SignUp({required String fullName, required String mobile, required String email, required String password})async{
    emit(SignUpLoadingState());
    var result = await signUpUseCase.call(fullName: fullName, mobile: mobile, email: email, password: password);
    result.fold((authEntity){
      emit(SignUpSuccessState(authEntity));
    }, (error){
      emit(SignUpErrorState(error));
    });
  }
}

abstract class SignUpStates{}
class SignUpInitialState extends SignUpStates{}
class SignUpLoadingState extends SignUpStates{}
class SignUpSuccessState extends SignUpStates{
  AuthEntity authEntity;
  SignUpSuccessState(this.authEntity);
}
class SignUpErrorState extends SignUpStates{
  String error;
  SignUpErrorState(this.error);
}