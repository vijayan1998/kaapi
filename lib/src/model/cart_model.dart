
class CartModel {
  final String? userid;
  final String? orderid;
  final String? time;
  final String? date;
  final String? address;
  final String? paymenttype;
  final String? paymentStatus;
  final String? transactionid;
  final double? subtotalamount;
  final double? discount;
  final double? grandtotal;
  final String? ordernote;
  final String? orderstatus;
  final List<OrderDetails>? orderDetails;

  CartModel({
    this.userid,
    this.orderid,
    this.time,
    this.date,
    this.address,
    this.paymenttype,
    this.paymentStatus,
    this.transactionid,
    this.subtotalamount,
    this.discount,
    this.grandtotal,
    this.ordernote,
    this.orderstatus,
    this.orderDetails,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      userid: json['userId'],
      orderid: json['orderId'],
      time: json['time'],
      date: json['date'],
      address: json['address'],
      paymenttype: json['payment_type'],
      paymentStatus: json['payment_status'],
      transactionid: json['transaction_id'],
      subtotalamount: json['sub_total_amount']?.toDouble(),
      discount: json['discount']?.toDouble(),
      grandtotal: json['grand_total']?.toDouble(),
      ordernote: json['order_note'],
      orderstatus: json['order_status'],
      orderDetails: json['order_details'] != null
          ? List<OrderDetails>.from(
              json['order_details'].map(
                (e) => OrderDetails.fromJson(e),
              ),
            )
          : [],
    );
  }

  Map<String,dynamic>toJson() {
    return {
      'userId':userid,
      'orderId':orderid,
      'time':time,
      'date':date,
      'address':address,
      'payment_type':paymenttype,
      'payment_status':paymentStatus,
      'transaction_id':transactionid,
      'sub_total_amount':subtotalamount,
      'discount':discount,
      'grand_total':grandtotal,
      'order_note':ordernote,
      'order_status':orderstatus,
      'order_details':orderDetails?.map((e) => e.toJson()).toList()
    };
  }
}



class OrderDetails{
  final String? prodcutid;
  final String? productimg;
  final String? productname;
  final double? price;
  final int? count;
  final double? total;

  OrderDetails({this.count,this.price,this.prodcutid,this.productimg,this.productname,this.total});

factory OrderDetails.fromJson(Map<String,dynamic>json){
  return OrderDetails(
    prodcutid: json['productId'],
    productimg: json['product_img'],
    productname: json['product_name'],
    price: json['price']?.toDouble(),
    total: json['total']?.toDouble(),
    count: json['count'],
  );
  }
Map<String,dynamic>toJson() {
  return {
    'productId':prodcutid,
    'product_img':productimg,
    'product_name':productname,
    'price':price,
    'count':count,
    'total':total,
  };
}
}