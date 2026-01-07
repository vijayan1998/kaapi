import 'dart:convert';

import 'package:hive/hive.dart' show Hive;
import 'package:http/http.dart' as http;
import 'package:kappi/src/bloc/apiurl.dart';
import 'package:kappi/src/model/cart_model.dart';
import 'package:kappi/src/model/member_model.dart';
import 'package:kappi/src/model/menu_model.dart';
import 'package:kappi/src/model/order_model.dart';
import 'package:kappi/src/model/store_model.dart';
import 'package:dio/dio.dart';
class StoreRepository{

  final Dio dio = Dio();
  final box = Hive.box('userBox');
    get userId => box.get('userId');

  //  Future<List<StoreModel>> fetchallList() async{
  //   final String url = 'http://10.36.62.5:5000/store/getallstores';
  //   final response = await dio.get(url);
  //   if(response.statusCode == 200){
  //     print('fnkdf:${response.data}');
  //    if (response.data is List) {
  //         print('dkfddhf:');
  //         // If response is a list of users
  //          List<dynamic> responsedata = response.data;
  //         // print('test3 (list): $responsedata');

  //         return responsedata
  //             .map((data) => StoreModel.fromjson(data))
  //             .toList();
  //       }
  //       else if (response.data is Map) {
  //         // If response is a single user object
  //         Map<String, dynamic> responsedata =
  //             Map<String, dynamic>.from(response.data);
  //         print('test3 (single object): $responsedata');

  //         return [StoreModel.fromjson(responsedata)];
  //       } else {
  //         throw Exception('Unexpected response format');
  //       }
  //   } else {
  //     throw Exception('Failed to data');
  //   }
  // }

  Future<List<StoreModel>> fetchallList() async {
    try {
      final response = await http.get(Uri.parse('${Apiurl.apiurl}/store/getallstores'));
      if(response.statusCode == 200){
         final decoeded = json.decode(response.body);
        List<dynamic> responsedata = decoeded['data'];
        return responsedata.map((data) => StoreModel.fromjson(data)).toList();
      }
      else {
        throw Exception('Error fetching courses:');
      }
    } catch (e) {
      throw Exception('Error fetching courses: $e');
    }
  }


  Future<List<MenuModel>> fetchMenulist(String storeid) async {
    try {
      final response = await http.get(Uri.parse('${Apiurl.apiurl}/menu/store/$storeid'));
      if(response.statusCode == 200){
        final decoded = json.decode(response.body);
        List<dynamic> responseData = decoded['data'];
        return responseData.map((data) => MenuModel.fromjson(data)).toList();
      }else {
        throw Exception('Error fetch menu');
      }
    } catch (e) {
      throw Exception('Error fetch menu:$e');
    }
  }

  Future<List<OrderModel>> categoryList() async{
    try {
      final response = await http.get(Uri.parse('${Apiurl.apiurl}/category/getallcategory'));
      if(response.statusCode == 200){
        final decoded = json.decode(response.body);
        List<dynamic> responseData = decoded['data'];
        return responseData.map((data) => OrderModel.fromjson(data)).toList(); 
      } else {
        throw Exception('Fetch Category list');
      }
    } catch (e) {
      throw Exception('Failed Data');
    }
  }

  Future<List<MenuModel>> storemenulist(String storeid,String categoryid) async {
    try {
      final response = await http.get(Uri.parse('${Apiurl.apiurl}/menu/store/$storeid/category/$categoryid'));
      if(response.statusCode == 200){
        final decoded = json.decode(response.body);
        List<dynamic> responseData = decoded['data'];
       return responseData.map((data) => MenuModel.fromjson(data)).toList();
      }
      else{
        throw Exception('Fetch Data Error');
      }
    } catch (e) {
      throw Exception('Fetch Error');
    }
  }

  Future<void> cartDetails (String productId) async {
    
    final response = await dio.post('${Apiurl.apiurl}/cart/$userId/add',
    data: {
      'productId':productId,
    });
    if(response.statusCode != 200){
      throw Exception('Failed to update cart');
    }
  }

  Future<void> cartCount (String productId,String count) async {
    
    final response = await dio.post('${Apiurl.apiurl}/cart/$userId/add',
    data: {
      'productId':productId,
      'count': count,
    });
    if(response.statusCode != 200){
      throw Exception('Failed to update cart count');
    }
  }
  Future<CartModel> cartList() async {
   
      final response = await http.get(Uri.parse('${Apiurl.apiurl}/cart/$userId'));
      if(response.statusCode ==200){
        final decoded = json.decode(response.body);
        // print('dfkdfh:$decoded');
        // List<dynamic> responseData = decoded['data'];
        // print('dfhdk:$responseData');
        return CartModel.fromJson(decoded['data']);
      }else{
        throw Exception('Fetch Data Error');
      }
  }

  Future<List<MemberModel>> memberList() async {
    final response = await http.get(Uri.parse('${Apiurl.apiurl}/membership/getallmembership'));
    if(response.statusCode == 200){
      final decoded = json.decode(response.body);
      List<dynamic> responseData = decoded['data'];
      return responseData.map((data) => MemberModel.fromJson(data)).toList();
    }else {
      throw Exception('Fetch Data Error');
    }
  }

}
