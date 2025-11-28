import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kappi/src/model/store_model.dart';
import 'package:dio/dio.dart';
class StoreRepository{

  final Dio dio = Dio();

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
      final response = await http.get(Uri.parse('http://10.36.62.5:5000/store/getallstores'));
     
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
}
