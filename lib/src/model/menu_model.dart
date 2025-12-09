class MenuModel {
  final String productid;
  final String productname;
  final String productimg;
  final String category;
  final String type;
  final int price;
  final List<AddOn>? addons;
  final List<String> availablestore;
  final String status;
  final String description;

  MenuModel({required this.productid,required this.productname,required this.productimg,required this.category,required this.availablestore,
  required this.addons,required this.price,required this.status,required this.type,required this.description});

  factory MenuModel.fromjson(Map<String,dynamic>json) {
    return MenuModel(
    productid: json['productId'] ?? '', 
    productname: json['product_name'] ?? '',
    productimg: json['product_img']?? '',
    category: json['category']?? '',  
    availablestore:List<String>.from(json['available_store'] ?? []), 
    addons: json['add_ons']!= null ? List<AddOn>.from(json['add_ons'].map((data) => AddOn.fromjson(data))) : [],  
    price: json['price'] ?? 0, 
    status: json['status'] ?? '',
    description: json['description'] ?? '', 
    type: json['type'] ?? '');
  }

  Map<String,dynamic>toJson() {
    return{
      'productId':productid,
      'product_name':productname,
      'product_img': productimg,
      'category': category,
      'available_store':availablestore,
      'add_ons':addons?.map((e) => e.toJson()).toList(),
      'price':price,
      'status':status,
      'description':description,
      'type':type,
    };
  }
}

class AddOn{
  final String? name;
  final int? value;

  AddOn({required this.name,required this.value});

  factory AddOn.fromjson(Map<String,dynamic>json){
    return AddOn(name: json['add_name'], 
    value: json['value']);
  }
  Map<String,dynamic>toJson() {
    return {
      'add_name': name,
      'value':value,
    };
  }
}