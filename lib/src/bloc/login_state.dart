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