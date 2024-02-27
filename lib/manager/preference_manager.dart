import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManger {

  static SharedPreferencesManger? _sharedPreferencesManger;

  static SharedPreferencesManger? getInstance() {
    _sharedPreferencesManger ??= SharedPreferencesManger();
    return _sharedPreferencesManger;
  }

  Future<String?> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  Future<void> setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }

  Future<int> getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(key) ?? 0;
  }

  Future<void> setInt(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, value);
  }

  Future<double> getDouble(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getDouble(key) ?? 0.0;
  }

  Future<void> setDouble(String key, double value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(key, value);
  }

  Future<bool> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }

  Future<void> setBool(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  Future clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  Future removeUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //prefs.remove(kUsername);
  }
}
