class OrderModel {
  final String categoryname;
  final String categoryimage;
  final List<String> type;

  OrderModel({required this.categoryimage,required this.categoryname,required this.type});

  factory OrderModel.fromjson(Map<String,dynamic> json){
    return OrderModel(
      categoryimage: json['category_img'] ?? '',
      categoryname: json['category_name'] ?? '',
      type:List<String>.from(json['type'] ?? []));
  }
  Map<String,dynamic>toJson() {
    return {
      'category_img':categoryimage,
      'category_name': categoryname,
      'type':type,
    };
  }
}

class Takeawaymodel {
  final String image;
  final String title;
  final String subtitle;
  
  Takeawaymodel({
    required this.image,required this.subtitle,required this.title
  });
}