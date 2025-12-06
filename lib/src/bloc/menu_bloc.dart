import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kappi/src/bloc/menu_event.dart';
import 'package:kappi/src/bloc/menu_state.dart';
import 'package:kappi/src/respositiory/api_service.dart';

class MenuBloc extends Bloc<MenuEvent,MenuState>{
  final StoreRepository storeRepository;
  MenuBloc(this.storeRepository) : super(FetchMenuInitiState()){
    on<FetchMenuEvent>((event,emit) async {
      emit(FetchMenuLoadingState());
      try {
        final menulist = await storeRepository.fetchMenulist(event.storeid);
        emit(FetchMenuSuccessState(menuModel: menulist));
      } catch (e) {
        emit(FetchMenuErrorState(message: e.toString()));
      }
    });
  }
}

class StoremenuBloc extends Bloc<MenuEvent,MenuState>{
  final StoreRepository storeRepository;
  StoremenuBloc(this.storeRepository) : super(FetchMenuInitiState()){
    on<FetchStoreMenuEvent>((event,emit) async{
      emit(FetchMenuLoadingState());
      try {
        final storemenulist = await storeRepository.storemenulist(event.storeid, event.category);
        emit(FetchMenuSuccessState(menuModel: storemenulist));
      } catch (e) {
        emit(FetchMenuErrorState(message: e.toString()));
      }
    });
  }
}