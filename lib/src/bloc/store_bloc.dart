import 'package:kappi/src/bloc/store_event.dart';
import 'package:kappi/src/bloc/store_state.dart';
import 'package:kappi/src/respositiory/api_service.dart';
import 'package:bloc/bloc.dart';



class FetchStoreBloc extends Bloc<StoreEvent,StoreState>{
  final StoreRepository storeRepository;

  FetchStoreBloc(this.storeRepository) : super(FetchStoreInitial()){
    on<FetchStoreEvent>((event,emit) async {
      emit(FetchStoreLoading());
      try {
          final fetchList = await storeRepository.fetchallList();
          emit(FetchStoreSuccess(storelist: fetchList));
      } catch (e) {
          emit(FetchStoreError(message: e.toString()));
      }
    });
  }
}