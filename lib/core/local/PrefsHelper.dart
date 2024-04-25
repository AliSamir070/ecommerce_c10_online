import 'package:shared_preferences/shared_preferences.dart';

class PrefsHelper{
  static late SharedPreferences sharedPreferences;
  static Future<void> init()async{
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> saveToken(String token)async{
    await sharedPreferences.setString("token", token);
  }
  static String getToken(){
    return sharedPreferences.getString("token")??"";
  }
  static clearToken(){
    sharedPreferences.remove("token");
  }

}