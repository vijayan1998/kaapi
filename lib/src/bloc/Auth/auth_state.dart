abstract class AuthState {}

class AuthinitialState extends AuthState{}

class AuthloadingState extends AuthState{}

class AuthLogoutState extends AuthState{}

class AuthLogginState extends AuthState{
  final String? userid;

  AuthLogginState({this.userid});
}