import 'package:shared_preferences/shared_preferences.dart';

class AppController {
  setLogin(val) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool("login", val);
  }

  Future<bool> getLogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool("login") ?? false;
  }
}
