import 'package:bloc/bloc.dart';
import 'package:ecommerce_c10_online/domain/entities/cart_response_entity/CartResponseEntity.dart';
import 'package:ecommerce_c10_online/domain/usecases/get_cart_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'cart_view_model_state.dart';
@injectable
class CartViewModel extends Cubit<CartViewModelState> {
  @factoryMethod
  CartViewModel(this.getCartUseCase) : super(CartViewModelInitial());

  static CartViewModel get(context)=>BlocProvider.of(context);

  GetCartUseCase getCartUseCase;

  GetCart()async{
    emit(CartViewModelLoadingState());
    var result = await getCartUseCase.call();
    result.fold((response){
      emit(CartViewModelSuccessState(response));
    }, (error){
      emit(CartViewModelErrorState(error));
    });
  }
}
