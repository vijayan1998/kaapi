abstract class CartEvent {}

class CartEventState extends CartEvent{
  final String productid;

  CartEventState({required this.productid});
}

class CartFetchEventState extends CartEvent{}

class CardCountEventState extends CartEvent{
  final String productid;
  final String count;

  CardCountEventState({required this.count,required this.productid});
}
