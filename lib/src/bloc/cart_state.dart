import 'package:kappi/src/model/cart_model.dart';

abstract class CartState{}

class CartInitialState extends CartState{}

class CartLoadingState extends CartState{}

class CartSuccessState extends CartState{
  final String message;

  CartSuccessState({ required this.message});
}

class CartErrorState extends CartState{
  final String error;

  CartErrorState({required this.error});
}


class CartFetchInitialState extends CartState{}

class CartFetchLoading extends CartState{}

class CartFetchSuccess extends CartState{
  final CartModel cartModel;

  CartFetchSuccess({required this.cartModel});
}

class CartFetchError extends CartState{
  final String message;

  CartFetchError({ required this.message});
}