abstract class LoginEvent {}

class LoginPostEvent extends LoginEvent{
  final String phone;

  LoginPostEvent({required this.phone});
}