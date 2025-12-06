import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:kappi/src/bloc/apiurl.dart';
import 'package:kappi/src/model/login_model.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
final Dio dio = Dio();
  
  String userid = '';

  Future<void> login(String phone) async {
    final box = Hive.box('userBox');
    final response = await dio.post('${Apiurl.apiurl}/user/createuser',
    data:  {
      'phone':phone,
    });
   
    if(response.statusCode == 200 || response.statusCode == 201){
      var json = response.data;
      // throw Exception('Login Success');
      //Extract the userID
       userid = json['data']['userId'];
      // save in Hive
      await box.put('userId', userid);
    }
  }

  Future<void> currentlocation(String userid,String latuitude,String langtude) async{
    final response = await dio.post('${Apiurl.apiurl}/user/$userid/current_location',
    data:  {
      'userId': userid,
      'latitude': latuitude,
      'longitude':langtude,
    });
    if(response.statusCode == 200){
      throw Exception('Current Location Added');
    }
  }

  Future<LoginModel> getuser() async{  
    final box = Hive.box('userBox');
    final userid = box.get('userId'); 
    final response = await http.get(Uri.parse('${Apiurl.apiurl}/user/$userid'));
    if(response.statusCode == 200){
      var jsondata = json.decode(response.body);
      return  LoginModel.fromjson(jsondata['data']);
    } else {
      throw Exception('fetch user list');
    }
  }

  Future<void> userDetails(String userimg,String username,String email) async {
    final box = Hive.box('userBox');
    final userid = box.get('userId');
    final response = await dio.put('${Apiurl.apiurl}/user/update/$userid',  
    data: {
      'user_img': userimg,
      'user_name':username,
      'email':email,
    });
    print('dkfk:${response.data}');
    if(response.statusCode == 200){
      throw Exception('User Details Update Successful');
    }
  }
}