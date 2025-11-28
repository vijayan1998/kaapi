
class LoginModel {
  final String phone;
  
  LoginModel({required this.phone});

  factory LoginModel.fromjson(Map<String,dynamic>json) {
    return LoginModel(phone: json['phone']);
  }

  Map<String,dynamic>toJson() {
    return {
      'phone':phone,
    };
  }

}