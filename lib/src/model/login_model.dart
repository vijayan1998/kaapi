
class LoginModel {
  final String phone;
  final String userid;
  final String username;
  final String email;
  final List<Address>? address;
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
    address: json['address'] != null ? List<Address>.from(json['address'].map((data) =>Address.fromJson(data))) : []);
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
      'address':address?.map((e)=>e.toJson()).toList(),
    };
  }

}

class Address{
  final String? addressid;
  final String? name;
  final String? contactnumber;
  final String? address1;
  final String? address2;
  final String? city;
  final String? state;
  final String? pincode;
  final bool? isVisible;

  Address({this.addressid, this.name,this.contactnumber,this.address1,this.address2,this.city,this.isVisible,this.pincode,this.state});

  factory Address.fromJson(Map<String,dynamic>json){
    return Address(
      addressid: json['_id'],
      name: json['location_name'],
      contactnumber: json['contact_number'],
      address1: json['address_line1'],
      address2: json['address_line2'],
      city: json['city'],
      state: json['state'],
      pincode: json['pin_code'],
      isVisible: json['is_default']
    );
  }
  Map<String,dynamic>toJson() {
    return {
      '_id':addressid,
      'location_name':name,
      'contact_number':contactnumber,
      'address_line1':address1,
      'address_line2':address2,
      'city':city,
      'state':state,
      'pin_code':pincode,
      'is_default':isVisible,
    };
  }
}