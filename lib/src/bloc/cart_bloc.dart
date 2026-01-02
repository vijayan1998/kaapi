import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kappi/src/bloc/cart_event.dart';
import 'package:kappi/src/bloc/cart_state.dart';
import 'package:kappi/src/respositiory/api_service.dart';

class CartBloc extends Bloc<CartEvent,CartState>{
  final StoreRepository storeRepository;

  CartBloc(this.storeRepository) : super(CartInitialState()){
    on<CartEventState>((event,emit) async {
      emit(CartLoadingState());
      try {
       await storeRepository.cartDetails(event.productid);
      emit(CartSuccessState(message:'Cart updated successful'));
      } catch (e) {
        emit(CartErrorState(error: e.toString()));
      }
    });
  }
}

class CartCountBloc extends Bloc<CartEvent,CartState>{
final StoreRepository storeRepository;

CartCountBloc(this.storeRepository) : super(CartInitialState()){
  on<CardCountEventState>((event,emit) async {
    emit(CartLoadingState());
    try {
      await storeRepository.cartCount(event.productid, event.count);
      emit(CartSuccessState(message: 'Count update successful'));
    } catch (e) {
      emit(CartErrorState(error: e.toString()));
    }
  });
}
}

class CartFetchBloc extends Bloc<CartEvent,CartState>{
  final StoreRepository storeRepository;

  CartFetchBloc(this.storeRepository) : super(CartFetchInitialState()){
    on<CartFetchEventState>((event,emit) async {
      emit(CartFetchLoading());
      try {
        final fetchlist = await storeRepository.cartList();
        emit(CartFetchSuccess(cartModel: fetchlist));
      } catch (e) {
        emit(CartFetchError(message: e.toString()));
      }
    });
  }
}