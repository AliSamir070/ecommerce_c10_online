part of 'cart_view_model_cubit.dart';

@immutable
abstract class CartViewModelState {}

class CartViewModelInitial extends CartViewModelState {}
class CartViewModelLoadingState extends CartViewModelState{}
class CartViewModelErrorState extends CartViewModelState{
  String error;
  CartViewModelErrorState(this.error);
}
class CartViewModelSuccessState extends CartViewModelState{
  CartResponseEntity cartResponseEntity;
  CartViewModelSuccessState(this.cartResponseEntity);
}
