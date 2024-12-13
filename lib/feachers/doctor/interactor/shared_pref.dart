import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefIntracter {
  Future<void> saveValue(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('login', value);
  }

  Future<String> loadSavedValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('login') ?? "";
  }

  Future<void> clearValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('login');
  }
}
