import 'package:dio/dio.dart';

class LoginRepository {
final Dio dio = Dio();

  Future<void> login(String phone) async {
    
    final response = await dio.post('http://10.36.62.5:5000/user/createuser',
    data:  {
      'phone':phone,
    });
    if(response.statusCode == 200){
      throw Exception('Login Success');
    }
  }
}