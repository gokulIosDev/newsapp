import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  SharedPreferences? preferences;
  Future<void> initprefs() async {
    preferences = await SharedPreferences.getInstance();
  }

  Future<void> setbool() async {
    await initprefs();
    preferences!.setBool("islogin", true);
  }

  Future<bool> getbool() async {
    await initprefs();
    return preferences!.getBool("islogin") ?? false;
  }

  Future<void> setToken(String token) async {
    await initprefs();
    preferences!.setString("token", token);
  }

  Future<String> getToken() async {
    await initprefs();
    return preferences!.getString("token") ?? "";
  }
}