import 'package:kappi/src/model/login_model.dart';

abstract class LoginState {}

class LoginStateintialState extends LoginState{

}

class LoginLodingState extends LoginState{}

class LoginSuccessState extends LoginState{
  final String loginModel;

  LoginSuccessState({required this.loginModel});
}

class LoginErrorState extends LoginState{
  final String message;

  LoginErrorState({required this.message});
}


class FetchLogininitalState extends LoginState {

}

class FetchLoginLoading extends LoginState{}

class FetchLoginSuccessState extends LoginState{
  final LoginModel loginModel;

  FetchLoginSuccessState({required this.loginModel});
}

class FetchLoginErrorState extends LoginState{
  final String message;

  FetchLoginErrorState({required this.message});
}