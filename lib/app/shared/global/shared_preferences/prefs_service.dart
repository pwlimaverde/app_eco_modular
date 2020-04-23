import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsService extends Disposable {
  //dispose will be called automatically

  Future<bool> getBool(String key) async {
    var prefs = await SharedPreferences.getInstance();

    return prefs.getBool(key) ?? false;
  }

  void setBool(String key, bool b) async {
    var prefs = await SharedPreferences.getInstance();

    prefs.setBool(key, b);
  }

  Future<int> getInt(String key) async {
    var prefs = await SharedPreferences.getInstance();

    return prefs.getInt(key) ?? 0;
  }

  void setInt(String key, int i) async {
    var prefs = await SharedPreferences.getInstance();

    prefs.setInt(key, i);
  }

  Future<String> getString(String key) async {
    var prefs = await SharedPreferences.getInstance();

    return prefs.getString(key) ?? "";
  }

  void setString(String key, String s) async {
    var prefs = await SharedPreferences.getInstance();

    prefs.setString(key, s);
  }

  void remove(String key) async {
    var prefs = await SharedPreferences.getInstance();

    prefs.remove(key);
  }

  @override
  void dispose() {}
}
