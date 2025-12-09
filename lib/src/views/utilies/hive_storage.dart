
import 'package:hive_flutter/adapters.dart';

class HiveStorage {
  static Box  get box => Hive.box('userBox');

  // store local storage
  static Future<void> saveuser(String user) async {
    await box.put('userId', user);
  }

// read local storage
  static String? readUser()  {
    final data = box.get('userId');
    return data;
  }
  // delete local storage
  static Future<void> clearUser() async {
    await box.delete('userId');
  }
}