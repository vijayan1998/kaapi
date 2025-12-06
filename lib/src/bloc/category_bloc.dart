
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kappi/src/bloc/category_event.dart';
import 'package:kappi/src/bloc/category_state.dart';
import 'package:kappi/src/respositiory/api_service.dart';

class CategoryBloc extends Bloc<CategoryEvent,CategoryState> {
  final StoreRepository categoryRepository;

  CategoryBloc(this.categoryRepository) : super(CategoryinitState()){
    on<CategoryEvent>((event, emit)async {
      emit(CategoryLoadingState());
      try {
        final categorylist = await categoryRepository.categoryList();
        emit(CategorySuccessState(orderModel: categorylist));
      } catch (e) {
        emit(CategoryErrorState(message: e.toString()));
      }
    });
  }

}