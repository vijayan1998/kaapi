
class LoginModel {
  final String phone;
  final String userid;
  final String username;
  final String email;
  final String address;
  final String userimg;
  final int walletbalance;
  final String membership;
  final String status;
  final String store;
  
  LoginModel({required this.userid,required this.username,required this.email,required this.address,required this.userimg,required this.walletbalance,required this.membership,required this.status,required this.store,required this.phone, });

  factory LoginModel.fromjson(Map<String,dynamic>json) {
    return LoginModel(phone: json['phone'] ?? '',
    userid: json['userId'] ?? '',
    username: json['user_name'] ?? '',
    userimg: json['user_img']?? '',
    email: json['email']?? '',
    walletbalance: json['wallet_balance'] ?? 0,
    membership: json['membership_type'] ??'',
    status: json['status']?? '',
    store: json['store']?.toString() ?? '',
    address: json['address']?.toString() ?? '');
  }

  Map<String,dynamic>toJson() {
    return {
      'phone':phone,
      'userId':userid,
      'user_name':username,
      'user_img':userimg,
      'email':email,
      'wallet_balance': walletbalance,
      'membership_type':membership,
      'status':status,
      'store':store,
      'address':address,
    };
  }

}