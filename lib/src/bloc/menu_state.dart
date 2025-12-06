import 'package:kappi/src/model/menu_model.dart';

abstract class MenuState {}

class FetchMenuInitiState extends MenuState{}

class FetchMenuLoadingState extends MenuState{}

class FetchMenuSuccessState extends MenuState{
  final List<MenuModel> menuModel;

  FetchMenuSuccessState({required this.menuModel});
  
}

class FetchMenuErrorState extends MenuState{
  final String message;

  FetchMenuErrorState({required this.message});
}