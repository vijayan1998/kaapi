import 'package:kappi/src/model/store_model.dart';

abstract class StoreState {}

class FetchStoreInitial extends StoreState{

}

class FetchStoreLoading extends StoreState{}

class FetchStoreSuccess extends StoreState{
  final List<StoreModel> storelist;
  FetchStoreSuccess({required this.storelist});
}

class FetchStoreError extends StoreState{
  final String message;

  FetchStoreError({required this.message});
}