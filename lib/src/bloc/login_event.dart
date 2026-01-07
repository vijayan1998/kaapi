import 'package:image_picker/image_picker.dart';

abstract class LoginEvent {}

class LoginPostEvent extends LoginEvent{
  final String phone;

  LoginPostEvent({required this.phone});
}

class LoginUpdateAddressEvent extends LoginEvent{
  final String addressid;
  final String name;
  final String contactnumber;
  final String address;
  final String address2;
  final String city;
  final String state;
  final String pincode;
  final bool isdefault;

  LoginUpdateAddressEvent({required this.name,required this.contactnumber,required this.address,required this.address2,required this.city,required this.state,required this.pincode,required this.isdefault,required this.addressid});
}

class FetchLoginEvent extends LoginEvent{}

class LocationPostEvent extends LoginEvent{
  final String userid;
  final String latitude;
  final String langtude;

  LocationPostEvent({required this.langtude,required this.latitude,required this.userid});
}

class LoginUpdateEvent extends LoginEvent{
  final XFile? userimg;
  final String username;
  final String email;

  LoginUpdateEvent({required this.email,required this.userimg,required this.username});
}

class LoginAddressEvent extends LoginEvent{
  final String name;
  final String contactnumber;
  final String address1;
  final String address2;
  final String city;
  final String state;
  final String pincode;
  final bool isVisible;

  LoginAddressEvent({required this.contactnumber,required this.name,required this.address1,required this.city,
  required this.address2,required this.isVisible,required this.pincode,required this.state});
}

class LoginAddressDeleteEvent extends LoginEvent{
  final String addressid;

  LoginAddressDeleteEvent({required this.addressid});
}