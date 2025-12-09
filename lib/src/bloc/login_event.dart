abstract class LoginEvent {}

class LoginPostEvent extends LoginEvent{
  final String phone;

  LoginPostEvent({required this.phone});
}

class FetchLoginEvent extends LoginEvent{}

class LocationPostEvent extends LoginEvent{
  final String userid;
  final String latitude;
  final String langtude;

  LocationPostEvent({required this.langtude,required this.latitude,required this.userid});
}

class LoginUpdateEvent extends LoginEvent{
  final String userimg;
  final String username;
  final String email;

  LoginUpdateEvent({required this.email,required this.userimg,required this.username});
}

class LoginAddressEvent extends LoginEvent{
  final String name;
  final String location;

  LoginAddressEvent({required this.location,required this.name});
}