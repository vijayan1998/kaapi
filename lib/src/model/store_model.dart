class StoreModel{
  final String storeid;
  final String storename;
  final String city;
  final String address;
  final int storenumber;
  final String openinghours;
  final String status;
  final double latitude;
  final double langitude;
  final int servicemeters;

  StoreModel({
    required this.storeid,
    required this.storename,
    required this.city,
    required this.address,
    required this.langitude,
    required this.latitude,
    required this.openinghours,
    required this.servicemeters,
    required this.status,
    required this.storenumber,
  });

  factory StoreModel.fromjson(Map<String,dynamic>json){
    return StoreModel(storeid: json['storeId'] ?? '', 
    storename: json['store_name'] ?? '', 
    city: json['city']?? '', 
    address: json['address'] ??'',
    langitude: json['latitude'] ?? '', 
    latitude: json['longitude'] ?? '', 
    openinghours: json['opening_hours']?? '', 
    servicemeters: json['serviceRadiusMeters']?? '', 
    status: json['status']?? '', 
    storenumber: json['store_number'] ?? '');
  }

  Map<String,dynamic>toJson(){
    return {
      'storeId':storeid,
      'store_name':storename,
      'city': city,
      'address':address,
      'store_number':storenumber,
      'opening_hours':openinghours,
      'latitude': latitude,
      'longitude':langitude,
      'serviceRadiusMeters':servicemeters,
      'status':status, 
    };
  }
}