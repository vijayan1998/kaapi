class MemberModel{
  final String? planname;
  final String? plandescription;
  final String? planimg;
  final double ? price;
  final String? validity;
  final String? termscondition;
  final String? cancelpolicy;
  final List<PlanBenefit>? planbenefits;

  MemberModel({this.planname,this.planimg,this.plandescription,this.price,this.termscondition,this.validity,
  this.cancelpolicy,this.planbenefits});

  factory MemberModel.fromJson(Map<String,dynamic>json){
    return MemberModel(
      planname: json['plan_name'],
      plandescription: json['plan_description'],
      planimg: json['plan_img'],
      price: json['price']?.toDouble(),
      validity: json['validity'],
      termscondition: json['terms_and_conditions'],
      cancelpolicy: json['cancellation_policy'],
      planbenefits: json['plan_benefits']  != null ? List<PlanBenefit>.from(json['plan_benefits'].map((e) =>PlanBenefit.fromJson(e))) : [],
    );
  }

  Map<String,dynamic>toJson() {
    return {
      'plan_name':planname,
      'plan_description':plandescription,
      'plan_img': planimg,
      'price':price,
      'validity':validity,
      'terms_and_conditions':termscondition,
      'cancellation_policy':cancelpolicy,
      'plan_benefits': planbenefits?.map((e)=>e.toJson()).toList(),
    };
  }
}



class PlanBenefit{
  final String? name;
  final String? description;

  PlanBenefit({this.description,this.name});

  factory PlanBenefit.fromJson(Map<String,dynamic>json){
    return PlanBenefit(
      name: json['name'],
      description: json['description']
    );
  }

  Map<String,dynamic>toJson(){
    return {
      'name':name,
      'description':description,
    };
  }

}