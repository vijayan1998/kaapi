abstract class MenuEvent {}

class FetchMenuEvent extends MenuEvent{
  final String storeid;

  FetchMenuEvent ({required this.storeid});
}

class FetchStoreMenuEvent extends MenuEvent{
  final String storeid;
  final String category;

  FetchStoreMenuEvent({required this.storeid,required this.category});
}