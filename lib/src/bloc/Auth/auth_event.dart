abstract class AuthEvent {}

class CheckuserEvent extends AuthEvent{
}

class SaveUserEvent extends AuthEvent{
  final String? userid;

  SaveUserEvent({this.userid});
}

class LogoutEvent extends AuthEvent{

}