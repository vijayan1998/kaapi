import 'package:kappi/src/model/order_model.dart';

abstract class  CategoryState{}

class CategoryinitState extends CategoryState{

}

class CategoryLoadingState extends CategoryState{

}

class CategorySuccessState extends CategoryState{
  final List<OrderModel> orderModel;

  CategorySuccessState({required this.orderModel});
}

class CategoryErrorState extends CategoryState{
  final String message;
  CategoryErrorState({required this.message});
}